require 'faraday'
require 'faraday_middleware'

class IGDBConnection
  def initialize
    @api_keys = [
      '6c75d0f210d175c332c2e92e09ed3b2b',
      '2f53817fc459511a921fedcb288a040f',
      '995fdf72f4833198f2710188f5903dcd',
      '6bfb20184d99c32c7a5298f1b480a293',
    ].shuffle!
    @selected_key = 0
    @connection = set_connection
    change_key
  end

  def set_connection
    Faraday.new url: 'https://api-2445582011268.apicast.io' do |conn|
      conn.headers['Accept'] = 'application/json'
      conn.response :json, :content_type => /\bjson$/
      conn.use :instrumentation
      conn.adapter Faraday.default_adapter
    end
  end

  def add_key(key)
    @api_keys += key
    @api_keys.shuffle!
    change_key
  end

  def remove_key
    @api_keys.delete_at(@selected_key)
    # notify
    puts "Key #{@selected_key} is not working\n"
  end

  def change_key(remove = false)
    remove_key if remove
    return false if @api_keys.size.zero?
    @selected_key = Random.new.rand(0...@api_keys.size)
    @connection.headers['user-key'] = @api_keys[@selected_key]
  end

  def get_data(request, params = nil)
    loop do
      response = get_response(request, params)
      puts response
      return response if response[:code] == 200
      change_key true if [401, 403].include?(response[:code])
      raise 'None API keys are working' if @api_keys.empty?
    end
  end

  def get_response(request_url, params)
    response = @connection.get request_url, params
    {code: response.status, body: response.body}
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
