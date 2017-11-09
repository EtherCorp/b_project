module V1
	class GameAltNames < Grape::API
		resource :game_alt_names do
			desc 'Get all game_alt_names'
				get do 
					present GameAltName.all, with: Entities::GameAltNameEntity
				end
			
				post do
					GameAltName.create_with_params(params)
				end

				put do
					GameAltName.update_with_params(params)
				end

				delete do
					GameAltName.destroy_with_params(params)
				end
			end
	
	end
end