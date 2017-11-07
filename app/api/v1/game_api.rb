module V1
	class GameApi < Grape::API
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


	resource :products do
			desc 'Get all products'
			get do 
				present Product.all, with: Entities::ProductEntity
			end
		
			post do
				Product.create_with_params(params)
			end

			put do
				Product.update_with_params(params)
			end

			delete do
				Product.destroy_with_params(params)
			end
		end


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

	resource :stores do
			desc 'Get all stores'
			get do 
				present Store.all, with: Entities::StoreEntity
			end
		
			post do
				Store.create_with_params(params)
			end

			put do
				Store.update_with_params(params)
			end

			delete do
				Store.destroy_with_params(params)
			end
		end	

	resource :clasifications do
			desc 'Get all clasifications'
			get do 
				present Clasification.all, with: Entities::ClasificationEntity
			end
		
			post do
				Clasification.create_with_params(params)
			end

			put do
				Clasification.update_with_params(params)
			end

			delete do
				Clasification.destroy_with_params(params)
			end
		end

	resource :countries do
			desc 'Get all countries'
			get do 
				present Country.all, with: Entities::CountryEntity
			end
		
			post do
				Country.create_with_params(params)
			end

			put do
				Country.update_with_params(params)
			end

			delete do
				Country.destroy_with_params(params)
			end
		end

	resource :currencies do
			desc 'Get all currencies'
			get do 
				present Currency.all, with: Entities::CurrencyEntity
			end
		
			post do
				Currency.create_with_params(params)
			end

			put do
				Currency.update_with_params(params)
			end

			delete do
				Currency.destroy_with_params(params)
			end
		end


	resource :evaluations do
		desc 'Get all evaluations'
			get do 
				present Evaluation.all, with: Entities::EvaluationEntity
			end
		
			post do
				Evaluation.create_with_params(params)
			end

			put do
				Evaluation.update_with_params(params)
			end

			delete do
				Evaluation.destroy_with_params(params)
			end
		end

	resource :game_alt_names do
		desc 'Get all game_alt_names'
			get do 
				present Game_alt_name.all, with: Entities::Game_alt_nameEntity
			end
		
			post do
				Game_alt_name.create_with_params(params)
			end

			put do
				Game_alt_name.update_with_params(params)
			end

			delete do
				Game_alt_name.destroy_with_params(params)
			end
		end

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

	resource :companies do
		desc 'Get all companies'
			get do 
				present Company.all, with: Entities::CompanyEntity
			end
		
			post do
				Company.create_with_params(params)
			end

			put do
				Company.update_with_params(params)
			end

			delete do
				Company.destroy_with_params(params)
			end
		end

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

	resource :company_roles do
		desc 'Get all Company_roles'
			get do 
				present Company_role.all, with: Entities::Company_roleEntity
			end
		
			post do
				Company_role.create_with_params(params)
			end

			put do
				Company_role.update_with_params(params)
			end

			delete do
				Company_role.destroy_with_params(params)
			end
		end

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

	resource :users do
		desc 'Get all users'
			get do 
				present User.all, with: Entities::UserEntity
			end
		
			post do
				User.create_with_params(params)
			end

			put do
				User.update_with_params(params)
			end

			delete do
				User.destroy_with_params(params)
			end
		end

	resource :roles do
		desc 'Get all roles'
			get do 
				present Role.all, with: Entities::RoleEntity
			end
		
			post do
				Role.create_with_params(params)
			end

			put do
				Role.update_with_params(params)
			end

			delete do
				Role.destroy_with_params(params)
			end
		end
    
    resource :user_logs do
		desc 'Get all user_logs'
			get do 
				present User_log.all, with: Entities::User_logEntity
			end
		
			post do
				User_log.create_with_params(params)
			end

			put do
				User_log.update_with_params(params)
			end

			delete do
				User_log.destroy_with_params(params)
			end
		end


	resource :product_prices do
		desc 'Get all product_prices'
			get do 
				present Product_price.all, with: Entities::Product_priceEntity
			end
		
			post do
				Product_price.create_with_params(params)
			end

			put do
				Product_price.update_with_params(params)
			end

			delete do
				Product_price.destroy_with_params(params)
			end
		end

	resource :store_products do
		desc 'Get all store_products'
			get do 
				present Store_product.all, with: Entities::Store_productEntity
			end
		
			post do
				Store_product.create_with_params(params)
			end

			put do
				Store_product.update_with_params(params)
			end

			delete do
				Store_product.destroy_with_params(params)
			end
		end

	end

end