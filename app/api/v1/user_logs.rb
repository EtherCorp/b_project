module V1
	class UserLogs < Grape::API
	    resource :user_logs do
			desc 'Get all user_logs'
				get do 
					present UserLog.all, with: Entities::UserLogEntity
				end
			
				post do
					UserLog.create_with_params(params)
				end

				put do
					UserLog.update_with_params(params)
				end

				delete do
					UserLog.destroy_with_params(params)
				end
			end
	
	end
end