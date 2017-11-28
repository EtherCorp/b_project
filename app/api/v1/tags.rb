module V1
	class Tags < Grape::API
		resource :tags do
			desc 'Get all tags'
				get do 
					present Tag.all, with: Entities::TagEntity
				end
			
				post do
					Tag.create_with_params(params)
				end

				put do
					Tag.update_with_params(params)
				end

				delete do
					Tag.destroy_with_params(params)
				end
			end
	
	end
end