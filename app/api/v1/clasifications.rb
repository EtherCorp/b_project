module V1
	class Clasifications < Grape::API
		resource :clasifications do
				desc 'Get all clasifications'
				get do 
					present Clasification.all, with: Entities::ClasificationEntity
				end
			
				post do
					Clasification.create_with_params(params)
				end

				put do
					Clasification.update_with_params(params)
				end

				delete do
					Clasification.destroy_with_params(params)
				end
			end
	
	end
end