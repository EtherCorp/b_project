module Drivers
	class Driver
		def parse_zmart(my_hash)
			parsed = {}
			parsed[:status] = "Pending"
			parsed[:site] = "zmart"
			parsed[:console] = my_hash['console']
			name_z = my_hash['name']
			name_z.slice! ' PS4' if name_z.include? 'PS4'
			name_z.slice! ' XBOX ONE' if name_z.include? 'XBOX ONE'
			parsed[:name] = name_z.strip
			price_z = my_hash['price']
			price_z.slice! '.' if price_z.include? '.'
			parsed[:price] = price_z.delete(' ')
			parsed[:availability] =  my_hash['availability']
			puts parsed
			parsed
		end
		def parse_sniper(my_hash)
			parsed = {}
			parsed[:status] = "Pending"
			parsed[:site] = "sniper"
			parsed[:console] = my_hash['console']
			parsed[:name] = my_hash['name']
			price_s = my_hash['price']
			if price_s.include? '.' and price_s.include? '$'
				price_s.slice! '.' and '$'
				#price_s.slice! 
			end
			parsed[:price] = price_s.delete(' ')
			parsed[:availability] =  my_hash['availability']
			puts parsed
			parsed	
		end
		#def parse_weplay(my_hash)
			
		#end
	end
end