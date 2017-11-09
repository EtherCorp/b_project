class GenreReader
  def initialize
    @total_genres = []
    @connection = IGDBConnection.new
  end

  # time limit = 3 minutes
  def get_data_request
    @url = '/genres/'
    set_options
    genre_request
    @total_genres
  end

  def set_options
    @options = {
      fields: 'name',
      limit: 30
    }
  end

  private # private functions

  def genre_request
    genre_response = @connection.get_data @url, @options
    @total_genres += genre_response[:body]
  end
end
