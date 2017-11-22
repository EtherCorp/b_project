module V1
	class Platforms < Grape::API
		resource :platforms do
			desc 'Get all platforms'
			get do 
				present Platform.all, with: Entities::PlatformEntity
			end
		
			post do
				Platform.create_with_params(params)
			end

			put do
				Platform.update_with_params(params)
			end

			delete do
				Platform.destroy_with_params(params)
			end
		end
	
	end
end