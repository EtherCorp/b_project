require 'activity_logger'
class DispatcherWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(site_name, my_hash)
    puts '---- Hello from DispatcherWorker ----'
    case site_name
    when "zmart"
    	conn = ActivityLogger.new
    	conn.save_scrap_zmart(my_hash)
    	puts "----saved zmart----"
    when "sniper"
    	conn = ActivityLogger.new
    	conn.save_scrap_sniper(my_hash)
    	puts "----saved sniper----"
    end

    puts '----- end saved data mongo --------'
    #Request::Patient.POST(normalized_json)
    puts 'TODO: Is saved data in postgre?'
    puts '-------------------------------------'
  end
end
