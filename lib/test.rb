##clase prara probar los metodos del modulo Scraper
class Test
    include Scrapers
    def initialize
      page = 'Sniper'
      scraper = Object.const_get('Scrapers::'+ page).new
      console = 'xbone'
      scraper.scrap(page,console)
    end
  end