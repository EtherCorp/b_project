module V1
	module Entities
		class StoreProductEntity < Grape::Entity
			expose :store_id
			expose :product_id
			expose :product_url
			expose :last_successful_scrap_at
			expose :last_scrapping_attempt_at
			expose :stock
			expose :enabled
		end
	end
end
