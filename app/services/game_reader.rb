class GameReader
  def initialize
    @total_games = []
    @total_data = {
      keywords: {}
    }
    @pagination = {}
    @connection = IGDBConnection.new
  end

  # time limit = 3 minutes
  def get_data_request(iterations = 1)
    @pagination[:next_page_url] = '/games/' # first time
    iterations.times do |i|
      game_request
      return @total_games if pagination[:pages] >= i
    end
    @total_games
  end

  def set_options(platform_id)
    @options = {
      fields: 'name,keywords,developers,publishers',
      limit: 50,
      scroll: 1,
      'filter[platforms][eq]' => platform_id,
      'filter[updated_at][gt]' => (DateTime.now - 365).strftime('%s')
    }
    options.each_key do |key|
      @options[key] = options[key]
    end
  end

  private # private functions

  def game_request
    game_response = @connection.get_data @pagination[:next_page_url], @options
    pagination = get_pagination_data game_response
    game_response.each do |game|
      add_data_to_game(game, 'keywords', 'name') if game.key? 'keywords'
      add_data_to_game(game, 'developers', 'name') if game.key? 'developers'
      add_data_to_game(game, 'publishers', 'name') if game.key? 'publishers'
      add_data_to_game(game, 'genres', 'name') if game.key? 'genres'
    end
    @total_games += game_response
    pagination
  end

  # adds generic data to game
  def add_data_to_game(game, list_name, field_name)
    keys_option = {fields: field_name}
    game[list_name].each do |key, value|
      field_data = @total_data[list_name.to_sym][value]
      unless field_data
        field_data = @connection.get_data("/#{list_name}/#{value}", keys_option)[0]
        @total_data[list_name.to_sym][value] = field_data[field_name]
      end
      game[list_name.to_sym][key] = field_data
    end
  end

  def get_pagination_data(response)
    puts response
    limit = @options[:limit]
    {
      count: response['X-Count'].to_i,
      pages: (response['X-Count'].to_i / limit),
      next_page_url: response['X-Next-page']
    }
  end
end
