Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/zmartPS4', to: 'scraping#zmart_ps4_scrape'
  get '/zmartXBONE', to: 'scraping#zmart_xbone_scrape'
  get '/weplay', to: 'scraping#weplay_scrape'
end
