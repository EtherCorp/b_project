require 'dotenv/tasks'
require 'benchmark'

namespace :add_data do
  desc 'read games from igdb api'
  task games: [:environment, :dotenv] do
    results = Benchmark.measure do
      reader = GameReader.new
      # 20 days before
      reader.process_all
      games = reader.cache.cache_data
      puts 'Example game:'
      puts games[:in_memory].first
      puts "Table: #{reader.reader_name}, stored #{games.size} elements"
      reader.data_counts.each do |name, size|
        puts "Table: #{name}, stored #{size} elements"
      end
      reader.store_to_db
      puts 'Data stored to db!'
    end
    puts 'Time execution: (user CPU time | system CPU time | user + system CPU | real elapsed time)'
    puts results
  end

  desc 'generate required data for igdb api'
  task gen_api: [:environment, :dotenv] do
    keys = [
      { owner_email: '59f25a2f3ae45@mailbox92.biz',
        key: '2f53817fc459511a921fedcb288a040f',
        key_class: 'free' },
      { owner_email: '32iu1whdsudu2@mailbox92.biz',
        key: '995fdf72f4833198f2710188f5903dcd',
        key_class: 'free' },
      { owner_email: 'ynfsdy7432rey@mailbox80.biz',
        key: '6bfb20184d99c32c7a5298f1b480a293',
        key_class: 'free' }
    ]
    keys.each do |key|
      result = IgdbKey.create_with(key.except(:owner_email)).find_or_create_by(owner_email: key[:owner_email])
      puts "Key with email #{key[:owner_email]} was created." if result
    end

    result = GameApi.create_with(url: 'https://api-2445582011268.apicast.io').find_or_create_by(name: 'API IGDB')
    puts "API IGDB created" if result
  end
end
