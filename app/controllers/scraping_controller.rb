class ScrapingController < ApplicationController
  # Define the Product object
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
  # Scrape of Zmart
  def zmart_scrape(url)
    require 'mechanize'
    agent = Mechanize.new
    page = agent.get(url)
    # link = page.link_with(text: 'Ver más Juegos de Playstation 4')
    # page = link.click
    # Build the products array
    games = page.css('.BoxProductoS2')
    @games_array = []
    games.each do |game|
      name = game.css('.BoxProductoS2_Descripcion').text
      price = game.css('.BoxProductoS2_Precios').css('.BoxProductoS2_Precio').text
      link = page.link_with(text: name)
      game_page = link.click
      availability = game_page.css('#ficha_producto_int').css('.txTituloRef')[0].text.split(' ')[1]
      @games_array << Game.new(name, price, availability)
    end
    # Render the array through the view
    render template: 'scraping_test'
  end

  def zmart_ps4_scrape
    url = 'https://www.zmart.cl/JuegosPS4'
    zmart_scrape(url)
  end

  def zmart_xbone_scrape
    url = 'https://www.zmart.cl/JuegosXBONE'
    zmart_scrape(url)
  end

  # Scrape of Weplay
  def weplay_scrape(url)
    require 'mechanize'
    agent = Mechanize.new
    page = agent.get(url)
    # Build the products array
    games = page.css('.products-grid')
    @games_array = []
    i = 0
    while games.css('.containerNombreYMarca')[i]
      name = games.css('.item .product-name')[i].text
      price = if games.css('.price-box')[i].css('.price')[1]
                games.css('.price-box')[i].css('.price')[1].text
              else
                games.css('.price-box')[i].css('.price')[0].text
              end
      i += 1
      link = page.link_with(text: name)
      game_page = link.click
      availability = game_page.css('.disponibilidadStock span').text
      @games_array << Game.new(name, price, availability)
    end
    # Render the array through the view
    render template: 'scraping_test'
  end

  def weplay_ps4_scrape
    url = 'http://www.weplay.cl/juegos/juegosps4.html'
    weplay_scrape(url)
  end

  def weplay_xbone_scrape
    url = '  http://www.weplay.cl/juegos/juegosxboxone.html'
    weplay_scrape(url)
  end
end
