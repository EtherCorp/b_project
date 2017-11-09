#Feature
class PlayerPerspectivesReader
  def initialize
    @total_player_perspectives = []
    @connection = IGDBConnection.new
  end

  # time limit = 3 minutes
  def get_data_request
    @url = '/player_perspectives/'
    set_options
    player_perspective_request
    @total_player_perspectives
  end

  def set_options
    @options = {
      fields: 'name',
      limit: 10
    }
  end

  private # private functions

  def player_perspective_request
    player_perspective_response = @connection.get_data @url, @options
    @total_player_perspectives += player_perspective_response[:body]
  end
end
