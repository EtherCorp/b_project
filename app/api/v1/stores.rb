module V1
	class Stores < Grape::API
		resource :stores do
			desc 'Get all stores'
			get do 
				present Store.all, with: Entities::StoreEntity
			end

			desc 'get a single store'
			get ':id' do
				Store.find_by(id: params[:id])
			end

			desc 'get store logs'
			get ':id/logs' do
				s = Store.find_by(id: params[:id])
				present s.store_logs.limit(5), with: Entities::StoreLogEntity
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

	
	end
end