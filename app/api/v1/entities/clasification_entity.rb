module V1
	module Entities
		class ClasificationEntity < Grape::Entity
			expose :normative_id
			expose :code
			expose :details
		end
	end
end
