module V1
	class Roles < Grape::API
		resource :roles do
			desc 'Get all roles'
				get do 
					present Role.all, with: Entities::RoleEntity
				end
			
				post do
					Role.create_with_params(params)
				end

				put do
					Role.update_with_params(params)
				end

				delete do
					Role.destroy_with_params(params)
				end
			end
	
	end
end