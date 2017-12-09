module Drivers
    class DriverSniper < Drivers::BaseDriver
        def parse_sniper(my_hash)
            parsed = {}
            parsed[:status] = "Pending"
            parsed[:site] = "sniper"
            parsed[:console] = my_hash[:console]
            parsed[:name] = my_hash[:name]
            price_s = my_hash[:price]
            price_s.slice! '.' if price_s.include? '.' 
            price_s.slice! '$' if price_s.include? '$'
            parsed[:price] = price_s.strip
            parsed[:availability] =  my_hash[:availability]
            parsed[:url] = my_hash[:url]
            puts parsed
        end
    end
end