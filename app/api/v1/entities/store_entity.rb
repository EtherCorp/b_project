module V1
	module Entities
		class StoreEntity < Grape::Entity
			expose :name
			expose :home_page
			expose :average_evaluation
		end
	end
end

