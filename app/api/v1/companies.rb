module V1
	class Companies < Grape::API
		resource :companies do
			desc 'Get all companies'
				get do 
					present Company.all, with: Entities::CompanyEntity
				end
			
				post do
					Company.create_with_params(params)
				end

				put do
					Company.update_with_params(params)
				end

				delete do
					Company.destroy_with_params(params)
				end
			end
	
	end
end