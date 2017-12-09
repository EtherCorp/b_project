module V1
	module Entities
		class GameEntity < Grape::Entity
			expose :name
			expose :description
		end
	end
end

