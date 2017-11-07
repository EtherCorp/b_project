module V1
	module Entities
		class NormativeEntity < Grape::Entity
			expose :name
			expose :code
		end
	end
end