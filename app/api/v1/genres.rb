module V1
	class Genres < Grape::API
		resource :genres do
			desc 'Get all genres'
				get do 
					present Genre.all, with: Entities::GenreEntity
				end
			
				post do
					Genre.create_with_params(params)
				end

				put do
					Genre.update_with_params(params)
				end

				delete do
					Genre.destroy_with_params(params)
				end
			end
	
	end
end