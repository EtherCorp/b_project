class IgdbReader
  def initialize(model_class)
    @connection = IgdbConnection.new
    @cache = IgdbCache.new model_class
    @pagination = nil
    @params = { limit: 10 }
  end

  def add_fields(url, fields_ary)
    @url = url
    @params[:fields] = fields_ary.join(',')
  end

  def custom_param(key, value)
    @params[key] = value
  end

  def add_filter(field, condition, value)
    @params["filter[#{field}][#{condition}]"] = value
  end

  def add_offset_pagination(max_pages = nil)
    @pagination = {
      method: :offset
    }
    @pagination[:max_pages] = max_pages
    @params[:offset] = 0
  end

  def add_scroll_pagination
    @pagination = {
      method: :scroll,
      count: 0,
      pages: 1,
      next_page_url: @url
    }
  end

  def process_all
    actual_url = @url
    loop do
      data = process_step actual_url
      break if data.empty?
      @cache.store_data data
      actual_url = update_pagination data
      break unless actual_url
    end
    @cache.cache_data
  end

  def process_step(url)
    @connection.get_data(url, @params)
  end

  # Only cache for now
  # Returns data with id in external_ids
  def process_by_id(external_ids)
    not_stored = @cache.not_in external_ids
    response = @connection.get_data("#{@url}/#{not_stored.join(',')}", @params)
    @cache.store_data response
    @cache.cache_data
  end

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
    @pagination[:next_page_url] = response['X-Next-page']
    @pagination[:next_page_url]
  end

  def update_offset
    @params[:offset] += @params[:limit]
    return @url if @pagination[:max_pages].nil?
    return false if @params[:offset] >= @pagination[:max_pages] * @params[:limit]
    @url
  end
end
