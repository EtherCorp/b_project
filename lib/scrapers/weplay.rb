module Scrapers
    class Weplay < Scrapers::BaseScraper
  # Get the price of the games of weplay
        def get_price_weplay(games, i)
            price = games.css('.price-box')[i].css('.price')[1]#oferta
            if price
                price.text
            else
                games.css('.price-box')[i].css('.price')[0].text
            end
        end

        def get_weplay_games(page,console)
            i = 0
            games = page.css('.products-grid')
            while games.css('.containerNombreYMarca')[i]
                name = games.css('.item .product-name')[i].text
                url_game= ''
                price = get_price_weplay(games, i)
                games.css('.item .product-name')[i].search('a').each do |link|
                    url_game = link['href']
                end
                i += 1
                game_page = get_game_page(name, page)
                availability = game_page.css('.disponibilidadStock span').text
                if url_game.nil? or console.nil? or name.nil? or price.nil?    
                    my_hash = {status: "CHANGED INFORMATION", site: "weplay",url: 'nil', console: 'nil' ,name: 'nil', price: 'nil', availability: 'nil'}
                    DispatcherWorker.perform_async("weplay", my_hash)
                else
                    my_hash = {status: "Pending", site: "weplay",url: url_game, console: console ,name: name, price: price, availability: availability}
                    DispatcherWorker.perform_async("weplay", my_hash)
                end

            end
        end

        # Scrape of Weplay
        def weplay_scrape(url,console)
            page = get_page(url)
            # Build the products array
            @games_array = []
            flag = 0
            while flag >= 0
                get_weplay_games(page,console)
                aux = page.link_with(class: 'next i-next').href
                page = page.link_with(class: 'next i-next').click
                next unless aux == page.link_with(class: 'next i-next').href
                flag = if flag == 1
                        -1
                        else
                        1
                        end
                end
        end
        def scrape_Weplay(console)
            url = 'http://www.weplay.cl/juegos/juegosps4.html' if console == "ps4"
            url = 'http://www.weplay.cl/juegos/juegosxboxone.html' if console == "xbone"
            weplay_scrape(url,console)
        end
    end
end