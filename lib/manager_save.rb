require 'activity_logger'
class ManagerSave 	
	 def save(my_hash)
		site_name= my_hash["site"]
 		conn = ActivityLogger.new
		method_name = "save_scrap_#{site_name}"
		conn.send(method_name,my_hash)
		scraper = Object.const_get('Drivers::Driver'+site_name).new
		puts "this is a json:"
		parsed = scraper.drive(my_hash)
		save_sql(parsed)
	end
	def save_sql(my_hash)
			ProductPrice.create_with_params(my_hash) if !StoreProduct.create_with_params(my_hash).nil?
	end
end