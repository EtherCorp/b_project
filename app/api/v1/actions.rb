module V1
	class Actions < Grape::API
		resource :actions do
			desc 'Get all actions'
				get do 
					present Action.all, with: Entities::ActionEntity
				end
			
				post do
					Action.create_with_params(params)
				end

				put do
					Action.update_with_params(params)
				end

				delete do
					Action.destroy_with_params(params)
				end
			end
	
	end
end