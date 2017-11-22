require 'dotenv/tasks'
require 'benchmark'

namespace :add_data do
  desc 'read games from igdb api'
  task games: [:environment, :dotenv] do
    results = Benchmark.measure do
      reader = GameReader.new
      # 20 days before
      reader.process_all
      games = reader.get_cache_data
      reader.success_api
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

  desc 'generate required data for igdb api operations'
  task gen_api: [:environment, :dotenv] do
    IgdbKey.create [
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
    GameApi.create_with(url: 'https://api-2445582011268.apicast.io').find_or_create_by(name: 'API IGDB')
  end

end
