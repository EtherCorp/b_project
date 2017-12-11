module Drivers
    class DriverWeplay < Drivers::BaseDriver
        def parse_Weplay(my_hash)
            parsed = {}
            parsed[:status] = "Pending"
            parsed[:site] = "Weplay"
            parsed[:console] = my_hash["console"]
            name_w = my_hash["name"]
            name_w.slice! ' PS4' if name_w.include? 'PS4'
            name_w.slice! ' XBOX ONE' if name_w.include? 'XBOX ONE'
            parsed[:name] = name_w.strip
            price_w = my_hash[:price]
            price_w.slice! '.' if price_w.include? '.' 
            price_w.slice! '$' if price_w.include? '$'
            parsed[:price] = price_w.strip
            parsed[:availability] =  my_hash["availability"]
            parsed[:url] = my_hash["url"]
            parsed    
        end
    end
end