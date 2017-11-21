module Driver
    class DriverZmart < Driver::BaseDriver
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
end