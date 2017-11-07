class GameReader
  def initialize
    @total_games = []
    @pagination_data = {}
    @connection = IGDBConnection.new
    init_params_data
    init_options
    init_store_data
  end

  def init_params_data
    @params_data = {
      'developers' => { query: 'companies', fields: ['name'] },
      'publishers' => { query: 'companies', fields: ['name'] },
      'keywords' => { query: 'keywords', fields: ['name'] },
      'genres' => { query: 'genres', fields: ['name'] },
      'platforms' => { query: 'platforms', fields: ['name'] }
    }
  end

  def hash_params(table)
    @params_data[table].merge table: table
  end

  def init_options
    platforms_option = request_platforms ['PlayStation 4', 'Xbox One']
    complex_fields = @params_data.keys.join(',')
    @options = {
      # scroll: 1,      # for pagination
      fields: "name,#{complex_fields}",
      limit: 10
    }
    add_filter_to_options 'updated_at', 'gt', (DateTime.now - 50).strftime('%s')
    add_filter_to_options 'release_dates.platform', 'any', platforms_option
  end

  def init_store_data
    @total_data = {}
    @params_data.each_key do |key|
      @total_data[key] = {}
    end
  end

  def add_filter_to_options(field, condition, value)
    @options["filter[#{field}][#{condition}]"] = value
  end

  # Returns games requested
  def get_data_request(iterations = 1)
    # note: time limit with pagination: 3 minutes
    @pagination_data[:next_page_url] = '/games/' # first time
    iterations.times do |i|
      game_request
      return @total_games if @pagination_data[:pages] >= i
    end
    @total_games
  end

  def request_platforms(platforms_name)
    options = { fields: 'name' }
    url = '/platforms/'
    platforms_id = []
    platforms_name.each do |p_name|
      options[:search] = p_name
      platforms_id << (@connection.get_data url, options)[0]['id']
    end
    return false if platforms_id.empty?
    platforms_id.join(',')
  end

  # Make a request to external API
  def game_request
    response = @connection.get_data @pagination_data[:next_page_url], @options
    @pagination_data = get_pagination_data response
    response.each do |game|
      process_response game
    end
    @total_games += response
  end

  # Process each data required of a game
  def process_response(game)
    @params_data.each do |l_name, v|
      add_data_to_game game, l_name, v[:query], v[:field] if game.key? l_name
    end
  end

  # Adds generic data to game
  def add_data_to_game(game, list_name, query, field)
    # Find games
    known_data = @total_data[list_name]
    to_register = game[list_name].reject { |id| known_data[id].nil? }
    list_ids = to_register.join(',')
    keys_option = { fields: field }
    url_query = "/#{query}/#{list_ids}"
    data = @connection.get_data(url_query, keys_option)
    # Assign elems to total_data
    data.each { |elem| @total_data[list_name][elem['id'].to_i] = elem[field] }
    # append field (TODO)
  end

  private :init_params_data, :init_options, :init_store_data
  private :add_filter_to_options, :request_platforms, :game_request
  private :process_response, :add_data_to_game, :get_pagination_data
end
