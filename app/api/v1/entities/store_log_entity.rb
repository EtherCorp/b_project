module V1
	module Entities
		class StoreLogEntity < Grape::Entity
      expose :online
      expose :created_at
		end
	end
end

