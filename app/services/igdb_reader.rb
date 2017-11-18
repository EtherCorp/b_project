class IgdbReader
  attr_reader :reader_name, :count
  def initialize(model_class)
    @connection = IgdbConnection.new
    @cache = IgdbCache.new model_class
    @reader_name = model_class if model_class.class == String
    @reader_name ||= model_class.name
    @pagination = nil
    @params = { limit: 50 }
    @count = 0
  end

  # Add fields to reader
  def add_fields(url, fields_ary)
    @url = url
    @params[:fields] = fields_ary.join(',')
  end

  # Remove a param (if it is necessary)
  def remove_param(key)
    @params.delete(key)
  end

  # Add a custom param, with a specific value
  def custom_param(key, value)
    @params[key] = value
  end

  # API will find according this filter (could be more than one)
  def add_filter(field, condition, value)
    @params["filter[#{field}][#{condition}]"] = value
  end

  # Set an offset pagination
  def add_offset_pagination(max_pages = nil)
    @pagination = {
      method: :offset
    }
    @pagination[:max_pages] = max_pages
    @params[:offset] = 0
  end

  # Set a sroll pagination, more powerful
  def add_scroll_pagination
    @pagination = {
      method: :scroll,
      count: 0,
      pages: 1
    }
    @params[:scroll] = 1
  end

  # Try to get all data acording passed parameters
  def process_all
    actual_url = @url
    loop do
      data = read_data actual_url
      break if data.nil?
      @count += data.body.size
      @cache.store_data data.body
      actual_url = update_pagination data
      break if actual_url.nil? || !actual_url
      post_loop if defined? post_loop
    end
    @cache.cache_data
  end

  # Internal function, used for separate responsabilities
  def read_data(url)
    data = process_step(url)
    puts "#{data.body.size} #{@reader_name} obtained!" unless data.nil?
    puts "None data obtained from #{@reader_name}" if data.nil?
    data
  end

  # Internal function, should be override for extends functionalities
  def process_step(url)
    @connection.get_data(url, @params)
  end

  # Only cache for now
  # Returns data with id in external_ids
  def process_by_id(external_ids)
    not_stored = @cache.not_in external_ids
    return if not_stored.empty?
    response = read_data("#{@url}/#{not_stored.join(',')}").body
    @cache.store_data response
    response
  end

  # Internal function, update pagination according selected option
  def update_pagination(response)
    return false if @pagination.nil?
    return update_scroll response if @pagination[:method] == :scroll
    return update_offset if @pagination[:method] == :offset
    false
  end

  # Return pagination data from response
  def update_scroll(response)
    @pagination[:count] = response['X-Count'].to_i
    @pagination[:pages] = response['X-Count'].to_i / (@params[:limit])
    response['X-Next-page']
  end

  # Internal function, update pagination modifying offset param
  def update_offset
    @params[:offset] += @params[:limit]
    return @url if @pagination[:max_pages].nil?
    return false if @params[:offset] >= @pagination[:max_pages] * @params[:limit]
    @url
  end

  # Store to db (TO DO)
  def store_to_db
    @cache.store_to_db
  end

  def get_cache_data
    @cache.cache_data
  end
end
