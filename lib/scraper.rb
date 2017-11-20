require 'mechanize'  
require 'json'
require_relative '../../b_project/app/workers/dispatcher_worker'
module Scraper
  class Game
    def initialize(name, price, availability)
      @name = name
      @price = price
      @availability = availability
    end
    attr_reader :name
    attr_reader :price
    attr_reader :availability
  end

  def get_page(url)
    agent = Mechanize.new
    agent.get(url)
  end

  # Get page of a particular game
  def get_game_page(name, page)
    link = page.link_with(text: name)
    link.click
  end

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
      @games_array << Game.new(name, price, availability)
      my_hash = {status: "Pending", site: "zmart",url: url_game, console: console, name: name, price: price, availability: availability}
     
      DispatcherWorker.perform_async("zmart", my_hash)
      puts my_hash
     
    end
    
  end

  def zmart_ps4_scrape
    url = 'https://www.zmart.cl/JuegosPS4'
    zmart_scrape(url,"ps4")
  end

  def zmart_xbone_scrape
    url = 'https://www.zmart.cl/JuegosXBONE'
    zmart_scrape(url,"xbone")
  end

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
      my_hash = {status: "Pending", site: "weplay",url: url_game, console: console ,name: name, price: price, availability: availability}
      puts my_hash
      DispatcherWorker.perform_async("weplay", my_hash)      
      @games_array << Game.new(name, price, availability)
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

  def weplay_ps4_scrape
    url = 'http://www.weplay.cl/juegos/juegosps4.html'
    weplay_scrape(url,"ps4")
  end

  def weplay_xbone_scrape
    url = '  http://www.weplay.cl/juegos/juegosxboxone.html'
    weplay_scrape(url,"xbone")
  end

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
      @games_array << Game.new(name, price, availability)
      my_hash = {status: "Pending", site: "sniper",url: url_game, console: console, name: name, price: price, availability: availability}
      puts url_game      
      DispatcherWorker.perform_async("sniper", my_hash)
      puts my_hash
    end
    
  end

  def sniper_ps4_scrape
    url = 'http://www.sniper.cl/index.php?id=VerSubCategoria&Cat=12&SubCat=36'
    sniper_scrape(url, "ps4")
  end

  def sniper_xbone_scrape
    url = 'http://www.sniper.cl/index.php?id=VerSubCategoria&Cat=13&SubCat=39'
    sniper_scrape(url,"xbone")
  end

end


##clase prara probar los metodos del modulo Scraper
class Test
  include Scraper
  def initialize
    #los metodos comentados hacen todos los scraping, recomendable trabajar con unno a la vez
    #para poder probarlos
    #sniper_ps4_scrape
    #sniper_xbone_scrape
    #zmart_ps4_scrape
    #zmart_xbone_scrape
    weplay_ps4_scrape
    #weplay_xbone_scrape
  end
end

Test.new

