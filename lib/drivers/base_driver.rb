module Driver
    class BaseDriver 
        def drive(my_hash)
            site=my_hash['site']
            method_name = "parse_#{site}"
            public_send(method_name,my_hash)
        end
    end
end
            
