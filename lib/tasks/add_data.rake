require 'dotenv/tasks'
require 'benchmark'

namespace :add_data do
  desc 'read games from igdb api'
  task games: [:environment, :dotenv] do
    results = Benchmark.measure do
      reader = GameReader.new
      # 20 days before
      reader.add_filter 'created_at', 'gt', (DateTime.now - 50).strftime('%Q')
      reader.process_all
      games = reader.get_cache_data
      puts 'Example game:'
      puts games.first
      puts "Table: #{reader.reader_name}, stored #{games.size} elements"
      reader.get_readers.each do |sub_reader|
        data = sub_reader.get_cache_data
        puts "Table: #{sub_reader.reader_name}, stored #{data.size} elements"
      end
    end
    puts 'Time execution: (user CPU time | system CPU time | user + system CPU | real elapsed time)'
    puts results
  end
end
