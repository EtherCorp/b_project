module V1
	class Features < Grape::API
		resource :features do
			desc 'Get all features'
				get do 
					present Feature.all, with: Entities::FeatureEntity
				end
			
				post do
					Feature.create_with_params(params)
				end

				put do
					Feature.update_with_params(params)
				end

				delete do
					Feature.destroy_with_params(params)
				end
			end	
	
	end
end