require 'activity_logger'
require 'manager_save' 
class DispatcherWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(my_hash)
    hash=my_hash
    manager = ManagerSave.new
    manager.save(my_hash)

  end
end