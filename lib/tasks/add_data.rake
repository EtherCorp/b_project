require 'dotenv/tasks'

namespace :add_data do
  desc 'add genres from igdb API to database'
  task genre: [:environment, :dotenv] do
    reader = GenreReader.new
    puts reader.get_data_request
  end

  desc 'add genres from igdb API to database'
  task games: [:environment, :dotenv] do
    reader = GameReader.new
    puts reader.get_data_request()
  end

  # only debug
  desc 'add genres from igdb API to database'
  task :on_demand, [:url, :limit, :offset, :fields, :search] => [:environment, :dotenv] do |_t, args|
    connection = IGDBConnection.new
    puts connection.get_data args[:url], {
      limit: args[:limit],
      offset: args[:offset],
      fields: args[:fields],
      search: args[:search]
    }
  end
end
