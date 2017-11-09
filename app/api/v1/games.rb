module V1
	class Games < Grape::API
		resource :games do
			desc 'Get all games'
			get do 
				present Game.all, with: Entities::GameEntity
			end

			post do
				Game.create_with_params(params)
			end

			put do
				Game.update_with_params(params)
			end

			delete do
				Game.destroy_with_params(params)
			end
		end
	end
end