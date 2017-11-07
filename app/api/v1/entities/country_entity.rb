module V1
	module Entities
		class CountryEntity < Grape::Entity
			expose :name
			expose :normative_id
		end
	end
end
