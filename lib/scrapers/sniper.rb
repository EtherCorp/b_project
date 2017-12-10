module Scrapers
  class Sniper < Scrapers::BaseScraper
    def sniper_scrape(url,console)
        page = get_page(url)
        # Build the products array
        @games_array = []
        games = page.css('#producto')
        games.each do |game|
          name = game.css('#titulo').text
          url_game = ''
          game.css('#datos').search('a').each do |link|
            url_game = 'http://www.sniper.cl/'+link['href']
          end
          price = game.css('#datos #precio')[0].css('strong')[0].text
          availability = 'Preguntar disponibilidad en tienda'

          if url_game.nil? or console.nil? or name.nil? or price.nil?    
            my_hash = {status: "CHANGED INFORMATION", site: "sniper",url: 'nil', console: 'nil' ,name: 'nil', price: 'nil', availability: 'nil'}
            DispatcherWorker.perform_async("sniper", my_hash)
          else
            my_hash = {status: "Pending", site: "sniper",url: url_game, console: console ,name: name, price: price, availability: availability}
            DispatcherWorker.perform_async("sniper", my_hash)
          end

          #puts my_hash
          #scraper = Object.const_get('Drivers::DriverSniper').new
          #scraper.drive(my_hash)
        end    
    end
    def scrape_Sniper(console)
      url = 'http://www.sniper.cl/index.php?id=VerSubCategoria&Cat=12&SubCat=36' if console == "ps4"
      url = 'http://www.sniper.cl/index.php?id=VerSubCategoria&Cat=13&SubCat=39' if console == "xbone"
      sniper_scrape(url,console)
    end
  end
end