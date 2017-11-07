module V1
	module Entities
		class User_logEntity < Grape::Entity
			expose :user_id
			expose :action_id
			expose :details
		end
	end
end
