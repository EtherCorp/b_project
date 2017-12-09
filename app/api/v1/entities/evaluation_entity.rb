module V1
	module Entities
		class EvaluationEntity < Grape::Entity
			expose :user_id
			expose :store_id
			expose :value
		end
	end
end
