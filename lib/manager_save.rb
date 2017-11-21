require 'activity_logger'
class ManagerSave 	
 	def save(site_name, my_hash)
 		conn = ActivityLogger.new
		method_name = "save_scrap_#{site_name}"
		conn.send(method_name,my_hash)
	end
end