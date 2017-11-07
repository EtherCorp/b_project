module V1
	module Entities
		class Product_priceEntity < Grape::Entity
			expose :product_store_id
			expose :normal_price
			expose :current_price
			expose :flash_deal_ends_at
		end
	end
end
