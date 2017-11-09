class ScrapingController < ActionController::Base
  include Scraper
  def sniper_xbone
    sniper_xbone_scrape
  end
  def sniper_ps4
    sniper_ps4_scrape
  end
  def weplay_xbone
    weplay_xbone_scrape
  end
  def weplay_ps4
    weplay_ps4_scrape
  end
  def zmart_xbone
    zmart_xbone_scrape
  end
  def zmart_ps4
    zmart_ps4_scrape
  end

end