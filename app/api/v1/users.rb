module V1
	class Users < Grape::API
		resource :users do
			desc 'Get all users'
				get do 
					present User.all, with: Entities::UserEntity
				end
			
				post do
					User.create_with_params(params)
				end

				put do
					User.update_with_params(params)
				end

				delete do
					User.destroy_with_params(params)
				end
			end
	
	end
end