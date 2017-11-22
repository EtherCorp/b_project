module V1
	module Entities
		class ProductEntity < Grape::Entity
			expose :name
			expose :details
			expose :release_date
		end
	end
end