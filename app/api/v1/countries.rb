module V1
	class Countries < Grape::API
		resource :countries do
				desc 'Get all countries'
				get do 
					present Country.all, with: Entities::CountryEntity
				end
			
				post do
					Country.create_with_params(params)
				end

				put do
					Country.update_with_params(params)
				end

				delete do
					Country.destroy_with_params(params)
				end
			end
	
	end
end