module V1
	module Entities
		class CurrencyEntity < Grape::Entity
			expose :name
			expose :symbol 
		end
	end
end
