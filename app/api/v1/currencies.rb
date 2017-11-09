module V1
	class Currencies < Grape::API
		resource :currencies do
				desc 'Get all currencies'
				get do 
					present Currency.all, with: Entities::CurrencyEntity
				end
			
				post do
					Currency.create_with_params(params)
				end

				put do
					Currency.update_with_params(params)
				end

				delete do
					Currency.destroy_with_params(params)
				end
			end
	
	end
end