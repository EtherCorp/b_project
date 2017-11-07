require 'faraday'
require 'faraday_middleware'

# Connects with IGDB API
class IgdbConnection
  # Class constructor
  # Set classes and necessary data for connection
  def initialize
    @key_balancer = KeyBalancer.new
    @connection = APIConnection.new(
      'https://api-2445582011268.apicast.io',
      'Accept' => 'application/json',
      'user-key' => @key_balancer.key
    )
    @change_key_codes = [401, 403]
  end

  # Get data requested
  def get_data(request, params = nil)
    loop do
      response = @connection.get_response(request, params)
      return response[:body] if response[:code] == 200
      raise_error_if_required response
      update_key_if_required response
    end
  end

  # Private function, raise an error with a prefixed format
  def raise_error(response)
    raise "Error #{response[:code]}: #{response[:body]}"
  end

  # Private function, raise an error if necessary
  def raise_error_if_required(response)
    code = response[:code]
    raise_error response if @connection.code?(400, code) && !(@change_key_codes.include? code)
    raise_error response if @connection.code? 500, code
  end

  # Private function, update key if necessary
  def update_key_if_required(response)
    update_key if @change_key_codes.include? response[:code]
    raise 'None API keys are working' unless @key_balancer.api_keys?
  end

  # Private function, modify header using a new key
  def update_key
    puts "Key #{@key_balancer.key} is not working\n"
    @key_balancer.remove_and_change_key
    @connection.update_headers('user-key' => @key_balancer.key)
  end

  # Useful IGDB API data #

  def esrb_rating
    {
      'RP' => 1,
      'EC' => 2,
      'E' => 3,
      'E10+' => 4,
      'T' => 5,
      'M' => 6,
      'AO' => 7
    }
  end

  def game_type
    {
      'Main game' => 0,
      'DLC / Addon' => 1,
      'Expansion' => 2,
      'Bundle' => 3,
      'Standalone expansion' => 4
    }
  end

  def pegi_rating
    {
      3 => 1,
      7 => 2,
      12 => 3,
      16 => 4,
      18 => 5
    }
  end

  private :raise_error, :raise_error_if_required, :update_key_if_required, :update_key
end
