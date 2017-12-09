# Connects with IGDB API
class IgdbConnection
  # Class constructor
  # Set classes and necessary data for connection
  def initialize
    store_api
    @key_balancer = KeyBalancer.new
    @connection = APIConnection.new(
      @api.url,
      'Accept' => 'application/json',
      'user-key' => @key_balancer.key
    )
    @change_key_codes = [401, 403]
  end

  def store_api
    @api = GameApi.create_with(url: 'https://api-2445582011268.apicast.io').find_or_create_by(name: 'API IGDB')
  end

  # Get data requested
  def get_data(request, params = nil)
    loop do
      response = @connection.get_response(request, params)
      # Obtained data and return it
      return response if response.status == 200
      # Reached the end of the scroll.
      return nil if response.status == 400
      raise_error_if_required response
      update_key_if_required response
    end
  end

  # Private function, raise an error with a prefixed format
  def raise_error(response)
    raise "Error #{response.status}: #{response.body}"
  end

  # Private function, raise an error if necessary
  def raise_error_if_required(response)
    code = response.status
    # raise_error response if @connection.code?(400, code) && !(@change_key_codes.include? code)
    raise_error response unless @change_key_codes.include? code
    raise_error response if @connection.code? 500, code
  end

  # Private function, update key if necessary
  def update_key_if_required(response)
    update_key if @change_key_codes.include? response.status
    raise 'None API keys are working' unless @key_balancer.api_keys?
  end

  # Private function, modify header using a new key
  def update_key
    puts "Key #{@key_balancer.key} is not working\n"
    @key_balancer.remove_and_change_key
    @connection.update_headers('user-key' => @key_balancer.key)
  end

  private :raise_error, :raise_error_if_required, :update_key_if_required, :update_key
  attr_reader :api
end
