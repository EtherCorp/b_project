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
      publishers = reader.get_reader_data 'publishers'
      developers = reader.get_reader_data 'developers'
      puts "GAMES\nstored: #{games.size}\n"
      puts "PUBLISHERS\nstored: #{publishers.size}\n"
      puts "DEVELOPERS\nstored: #{developers.size}\n"
    end
    puts 'Time execution: (user CPU time | system CPU time | user + system CPU | real elapsed time)'
    puts results
  end
end
