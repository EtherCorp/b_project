require 'dotenv/tasks'

namespace :add_data do
  desc 'EXAMPLE'
  task developers: [:environment, :dotenv] do
    reader = IgdbReader.new Developer
    reader.add_fields '/companies/', ['name']
    reader.custom_param :limit, 5
    reader.add_offset_pagination 3
    puts reader.process_all
  end

  desc 'EXAMPLE'
  task developers_ids: [:environment, :dotenv] do
    reader = IgdbReader.new Developer
    ids = [6630,6631,6632]
    reader.add_fields '/companies/', ['name']
    reader.custom_param :limit, 5
    puts reader.process_by_id ids
  end

  desc 'add genres from igdb API to database'
  task games: [:environment, :dotenv] do
    reader = GameReader.new
    puts reader.get_data_request()
  end

  # only debug
  desc 'add genres from igdb API to database'
  task :id_demand, [:url, :ids, :fields, :search] => [:environment, :dotenv] do |_t, args|
    reader = IgdbReader.new
    ids = args[:ids].split(',')
    fields = args[:fields].split(',')
    reader.add_fields(args[:url], fields)
  end
end
