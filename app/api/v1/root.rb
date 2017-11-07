module V1
	class Root < Grape::API
		version 'v1'
		format :json
		prefix :api

		get :status do 
			{status:'Ok!'}
			
		end

		mount V1::GameApi


	end
end