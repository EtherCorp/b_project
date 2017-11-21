require 'activity_logger'
require 'manager_save' 
class DispatcherWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(site_name, my_hash)
    manager = ManagerSave.new
    puts '---- Hello from DispatcherWorker ----'
    sleep(5)
    manager.save(site_name, my_hash)
    puts '----- end saved data mongo --------'
    puts 'TODO: Is saved data in postgre?'
    puts '-------------------------------------'
  end
end