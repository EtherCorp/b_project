module V1
	class Stores < Grape::API
		resource :stores do
			desc 'Get all stores'
			get do 
				present Store.all, with: Entities::StoreEntity
			end
		
			post do
				Store.create_with_params(params)
			end

			put do
				Store.update_with_params(params)
			end

			delete do
				Store.destroy_with_params(params)
			end
		end	

	
	end
end