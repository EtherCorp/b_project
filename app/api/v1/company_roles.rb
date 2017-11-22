module V1
	class CompanyRoles < Grape::API
		resource :company_roles do
			desc 'Get all Company_roles'
				get do 
					present CompanyRole.all, with: Entities::CompanyRoleEntity
				end
			
				post do
					CompanyRole.create_with_params(params)
				end

				put do
					CompanyRole.update_with_params(params)
				end

				delete do
					CompanyRole.destroy_with_params(params)
				end
			end
	
	end
end