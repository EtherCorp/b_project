require 'sidekiq/web'

Rails.application.routes.draw do

	mount V1::Root => '/'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web =>'/sidekiq'
  get '/zmartPS4', to: 'scraping#zmart_ps4'
  get '/zmartXBONE', to: 'scraping#zmart_xbone'
  get '/weplayPS4', to: 'scraping#weplay_ps4'
  get '/weplayXBONE', to: 'scraping#weplay_xbone'
  get '/sniperPS4', to: 'scraping#sniper_ps4'
  get '/sniperXBONE', to: 'scraping#sniper_xbone'
end

