namespace :create do
  desc 'Task to create data'
  task stores: [:environment, :dotenv] do
    Store.create(name: 'Zmart', home_page: 'https://www.zmart.cl/', average_evaluation: 1.0)
    Store.create(name: 'WePlay', home_page: 'https://www.weplay.cl', average_evaluation: 1.0)
  end
end
