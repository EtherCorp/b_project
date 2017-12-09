module V1
	class ProductPrices < Grape::API
		resource :product_prices do
			desc 'Get all product_prices'
				get do 
					present ProductPrice.all, with: Entities::ProductPriceEntity
				end
			
				post do
					ProductPrice.create_with_params(params)
				end

				put do
					ProductPrice.update_with_params(params)
				end

				delete do
					ProductPrice.destroy_with_params(params)
				end
			end
	
	end
end