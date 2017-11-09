module V1
	class Products < Grape::API
		resource :products do
			desc 'Get all products'
			get do 
				present Product.all, with: Entities::ProductEntity
			end
		
			post do
				Product.create_with_params(params)
			end

			put do
				Product.update_with_params(params)
			end

			delete do
				Product.destroy_with_params(params)
			end
		end
	
	end
end