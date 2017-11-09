module V1
	class Normatives < Grape::API
		resource :normatives do
			desc 'Get all normatives'
				get do 
					present Normative.all, with: Entities::NormativeEntity
				end
			
				post do
					Normative.create_with_params(params)
				end

				put do
					Normative.update_with_params(params)
				end

				delete do
					Normative.destroy_with_params(params)
				end
			end
	
	end
end