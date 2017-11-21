require 'net/ping'

module Monitoring
  class TestConnection
    @url1 = 'https://www.google.com'
    @url2 = 'https://www.twitter.com'
    @url3 = 'https://www.facebook.com'

    def self.ping
      return false unless Net::Ping::HTTP.new(@url1).ping?
      return false unless Net::Ping::HTTP.new(@url2).ping?
      return false unless Net::Ping::HTTP.new(@url3).ping?
      true
    end
  end
end
