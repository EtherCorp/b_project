module V1
	module Entities
		class GameEntity < Grape::Entity
			expose :name
			expose :developer_id
			expose :release_date
			expose :description
		end
	end
end

