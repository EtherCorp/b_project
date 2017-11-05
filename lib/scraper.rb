require 'mechanize'  
require 'json'
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
  def zmart_scrape(url)
    page = get_page(url)
    games = page.css('.BoxProductoS2')
    @games_array = []
    games.each do |game|
      name = game.css('.BoxProductoS2_Descripcion').text
      price = game.css('.BoxProductoS2_Precios').css('.BoxProductoS2_Precio').text
      game_page = get_game_page(name, page)
      availability = game_page.css('#ficha_producto_int').css('.txTituloRef')[0].text.split(' ')[1]
      @games_array << Game.new(name, price, availability)
      ##########################################################################################################
      ##esto se debe guardar
      my_hash = { name: name, price: price, availability: availability}
      my_hash = JSON.generate(my_hash)
      puts my_hash
    end
    # Render the array through the view
    #render template: 'scraping_test'
  end

  def zmart_ps4_scrape
    url = 'https://www.zmart.cl/JuegosPS4'
    zmart_scrape(url)
  end

  def zmart_xbone_scrape
    url = 'https://www.zmart.cl/JuegosXBONE'
    zmart_scrape(url)
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

  def get_weplay_games(page)
    i = 0
    games = page.css('.products-grid')
    while games.css('.containerNombreYMarca')[i]
      name = games.css('.item .product-name')[i].text
      price = get_price_weplay(games, i)
      i += 1
      game_page = get_game_page(name, page)
      availability = game_page.css('.disponibilidadStock span').text
      ##########################################################################################################
      ##esto se debe guardar
      my_hash = { name: name, price: price, availability: availability}
      my_hash = JSON.generate(my_hash)
      puts my_hash
      @games_array << Game.new(name, price, availability)
    end
  end

  # Scrape of Weplay
  def weplay_scrape(url)
    page = get_page(url)
    # Build the products array
    @games_array = []
    flag = 0
    while flag >= 0
      get_weplay_games(page)
      aux = page.link_with(class: 'next i-next').href
      page = page.link_with(class: 'next i-next').click
      next unless aux == page.link_with(class: 'next i-next').href
      flag = if flag == 1
               -1
             else
               1
             end
    end
    # Render the array through the view
    #render template: 'scraping_test'
  end

  def weplay_ps4_scrape
    url = 'http://www.weplay.cl/juegos/juegosps4.html'
    weplay_scrape(url)
  end

  def weplay_xbone_scrape
    url = '  http://www.weplay.cl/juegos/juegosxboxone.html'
    weplay_scrape(url)
  end

  def sniper_scrape(url)
    page = get_page(url)
    # Build the products array
    @games_array = []
    games = page.css('#producto')
    games.each do |game|
      name = game.css('#titulo').text
      price = game.css('#datos #precio')[0].css('strong')[0].text
      availability = 'Preguntar disponibilidad en tienda'
      @games_array << Game.new(name, price, availability)
      ##########################################################################################################
      ##esto se debe guardar
      my_hash = { name: name, price: price, availability: availability}
      my_hash = JSON.generate(my_hash)
      puts my_hash
    end
    # Render the array through the view
    #render template: 'scraping_test'
  end

  def sniper_ps4_scrape
    url = 'http://www.sniper.cl/index.php?id=VerSubCategoria&Cat=12&SubCat=36'
    sniper_scrape(url)
  end

  def sniper_xbone_scrape
    url = 'http://www.sniper.cl/index.php?id=VerSubCategoria&Cat=13&SubCat=39'
    sniper_scrape(url)
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
    zmart_xbone_scrape
    #weplay_ps4_scrape
    #weplay_xbone_scrape
  end
end

Test.new

