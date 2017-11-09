Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/zmartPS4', to: 'scraping#zmart_ps4_scrape'
  get '/zmartXBONE', to: 'scraping#zmart_xbone_scrape'
  get '/weplayPS4', to: 'scraping#weplay_ps4_scrape'
  get '/weplayXBONE', to: 'scraping#weplay_xbone_scrape'
  get '/sniperPS4', to: 'scraping#sniper_ps4_scrape'
  get '/sniperXBONE', to: 'scraping#sniper_xbone_scrape'
end
