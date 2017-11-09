require 'faraday'
require 'faraday_middleware'

# Allow to connect with an external API
class APIConnection
  # Class constructor
  def initialize(url, headers, response_type = 'json')
    @connection = Faraday.new url: url do |conn|
      update_headers_conn headers, conn
      conn.response :json, content_type: /\b#{response_type}$/
      conn.adapter Faraday.default_adapter
    end
  end

  # Get response
  def get_response(request_url, params)
    @connection.get request_url, params
  end

  # Set headers to connection
  def update_headers(headers)
    update_headers_conn(headers, @connection)
  end

  # Private function, set headers to connection
  def update_headers_conn(headers, connection)
    headers.each do |key, value|
      connection.headers[key] = value
    end
  end

  # True if code is between type and type + 99
  def code?(type, response_code)
    response_code >= type && response_code < (type + 100)
  end

  private :update_headers_conn
end
