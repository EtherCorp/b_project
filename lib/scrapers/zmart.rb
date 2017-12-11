module Scrapers
    class Zmart < Scrapers::BaseScraper        
        # Scrape of Zmart
        def zmart_scrape(url,console)
            page = get_page(url)
            games = page.css('.BoxProductoS2')
            @games_array = []
            games.each do |game|
                url_game= ''
                name = game.css('.BoxProductoS2_Descripcion').text
                price = game.css('.BoxProductoS2_Precios').css('.BoxProductoS2_Precio').text
                game.css('.BoxProductoS2_Image').search('a').each do |link|
                    url_game = 'http://www.zmart.cl'+link['href']
                end
                game_page = get_game_page(name, page)
                availability = game_page.css('#ficha_producto_int').css('.txTituloRef')[0].text.split(' ')[1]
                if url_game.nil? or console.nil? or name.nil? or price.nil?    
                    my_hash = {status: "CHANGED INFORMATION", site: "Zmart",url: 'nil', console: 'nil' ,name: 'nil', price: 'nil', availability: 'nil'}
                    DispatcherWorker.perform_async(my_hash)
                else
                    my_hash = {status: "Pending", site: "Zmart",url: url_game, console: console, name: name, price: price, availability: availability}    
                    DispatcherWorker.perform_async(my_hash)
                end

            end
        end
        def scrape_Zmart(console)
            url = 'https://www.zmart.cl/JuegosPS4' if console == "ps4"
            url = 'https://www.zmart.cl/JuegosXBONE' if console == "xbone"
            zmart_scrape(url,console)
        end
    end
  end