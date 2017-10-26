require 'unirest'

class IGDBConnection
  def initialize
    @igdb_api_key = ENV['IGDB_API_KEY']
    @request_url = ENV['IGDB_REQUEST_URL']
  end

  def set_keys(api_key, request_url)
    @igdb_api_key = api_key
    @request_url = request_url
  end

  def get_data(request, params = nil)
    response = Unirest.get(
      @request_url + request,
      parameters: params,
      headers: {
        'user-key' => @igdb_api_key,
        'Accept' => 'application/json'
      }
    )
    {code: response.code, body: response.body}
  end

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
end
