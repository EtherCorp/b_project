module V1
	class Root < Grape::API
		version 'v1'
		format :json
		prefix :api

		get :status do 
			{status:'Ok!'}
		end

		mount ::V1::Actions
		mount ::V1::Clasifications
		mount ::V1::Companies
		mount ::V1::CompanyRoles
		mount ::V1::Countries
		mount ::V1::Currencies
		mount ::V1::Evaluations
		mount ::V1::Features
		mount ::V1::GameAltNames
		mount ::V1::Games
		mount ::V1::Genres
		mount ::V1::Normatives
		mount ::V1::Platforms
		mount ::V1::ProductPrices
		mount ::V1::Products
		mount ::V1::Roles
		mount ::V1::ServerStatusLogs
		mount ::V1::StoreProducts
		mount ::V1::Stores
		mount ::V1::Tags
		mount ::V1::UserLogs
		mount ::V1::Users
			
	end	
end