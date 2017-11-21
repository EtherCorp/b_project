module Driver
    class DriverZmart
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
            parsed[:url] = my_hash['url']
            parsed
        end
    end
    class DriverSniper
        def parse_sniper(my_hash)
            parsed = {}
            parsed[:status] = "Pending"
            parsed[:site] = "sniper"
            parsed[:console] = my_hash['console']
            parsed[:name] = my_hash['name']
            price_s = my_hash['price']
            price_s.slice! '.' if price_s.include? '.' 
            price_s.slice! '$' if price_s.include? '$'
            parsed[:price] = price_s.strip
            parsed[:availability] =  my_hash['availability']
            parsed[:url] = my_hash['url']
            parsed
        end
    end
    class DriverWeplay
        def parse_weplay(my_hash)
            parsed = {}
            parsed[:status] = "Pending"
            parsed[:site] = "weplay"
            parsed[:console] = my_hash['console']
            name_w = my_hash['name']
            name_w.slice! ' PS4' if name_w.include? 'PS4'
            name_w.slice! ' XBOX ONE' if name_w.include? 'XBOX ONE'
            parsed[:name] = name_w.strip
            price_w = my_hash['price']
            price_w.slice! '.' if price_w.include? '.' 
            price_w.slice! '$' if price_w.include? '$'
            parsed[:price] = price_w.strip
            parsed[:availability] =  my_hash['availability']
            parsed[:url] = my_hash['url']
            parsed    
        end
    end
end