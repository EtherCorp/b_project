module V1
	module Entities
		class GameAltNameEntity < Grape::Entity
			expose :name
			expose :game_id
		end
	end
end