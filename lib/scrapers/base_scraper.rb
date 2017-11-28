require 'mechanize'  
require 'json'
require_relative '../../app/workers/dispatcher_worker'
module Scrapers
  class BaseScraper
    def scrap(page,console)
      method_name = "scrape_#{page}"
      public_send(method_name,console)
    end

    def get_page(url)
      agent = Mechanize.new
      agent.get(url)
    end

    def get_game_page(name, page)
      link = page.link_with(text: name)
      link.click
    end
  end
end  