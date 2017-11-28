require 'net/ping'

module Monitoring
  class Connection
    @test = ['https://www.google.com', 'https://www.twitter.com', 'https://www.facebook.com']

    def self.test
      @test.each do |page|
        return false unless Net::Ping::HTTP.new(page).ping?
      end
      true
    end

    def self.check(page_url)
      return false unless Net::Ping::HTTP.new(page_url).ping?
      true
    end
  end
end
