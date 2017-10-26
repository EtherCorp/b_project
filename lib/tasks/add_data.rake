require 'dotenv/tasks'

namespace :add_data do
  desc 'add genres from igdb API to database'
  task genre: :environment do
    reader = GenreReader.new
    puts reader.get_data_request
  end

end
