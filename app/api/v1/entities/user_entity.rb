module V1
	module Entities
		class UserEntity < Grape::Entity
			expose :username
			expose :country_id
			#expose :password
			#expose :encrypted_password
			expose :email
		end
	end
end