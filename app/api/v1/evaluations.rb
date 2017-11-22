module V1
	class Evaluations < Grape::API
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
	
	end
end