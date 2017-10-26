class GenreReader
  def initialize
    @total_genres = []
    @connection = IGDBConnection.new
  end

  # time limit = 3 minutes
  def get_data_request()
    @url = '/genres/' # first time
    genre_request    
    @total_genres
  end
    
  def set_options()
    @options = {
      fields: 'name',
      limit: 30,
    }
  end

  private # private functions

  def genre_request
    set_options()
    genre_response = @connection.get_data @url, @options
    @total_games += genre_response
    pagination
  end

end
