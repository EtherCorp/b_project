class PlatformReader
  def initialize
    @total_platforms = []
    @connection = IGDBConnection.new
  end

  # time limit = 3 minutes
  def get_data_request
    @url = '/platforms/'
    set_options
    platform_request
    @total_platforms
  end

  def set_options
    @options = {
      fields: 'name',
      limit: 70
    }
  end

  private # private functions

  def platform_request
    platform_response = @connection.get_data @url, @options
    @total_platforms += platform_response[:body]
  end
end
