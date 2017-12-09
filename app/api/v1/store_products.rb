module V1
	class StoreProducts < Grape::API
		resource :store_products do
			desc 'Get all store_products'
				get do 
					present StoreProduct.all, with: Entities::StoreProductEntity
				end
			
				post do
					StoreProduct.create_with_params(params)
				end

				put do
					StoreProduct.update_with_params(params)
				end

				delete do
					StoreProduct.destroy_with_params(params)
				end
			end
	
	end
end