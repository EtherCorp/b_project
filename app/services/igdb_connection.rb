require 'unirest'

class IGDBConnection
  def initialize
    @request_url = 'https://api-2445582011268.apicast.io'
    @api_keys = [
      '6c75d0f210d175c332c2e92e09ed3b2b',
      '2f53817fc459511a921fedcb288a040f',
      '995fdf72f4833198f2710188f5903dcd',
      '6bfb20184d99c32c7a5298f1b480a293',
    ]
  end

  def set_key(api_key)
    @api_keys += api_key
  end

  def get_data(request, params = nil)
    response = nil
    keys = @api_keys.shuffle
    keys.each do |key|
      response = get_response(request, params, key)
      puts response
      puts key
      return response if response[:code] == 200
    end
    raise 'None API keys works'
  end

  def get_response(request, params, key)
    response = Unirest.get(
      @request_url + request,
      parameters: params,
      headers: {
        'user-key' => key,
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
  private :get_response
end
