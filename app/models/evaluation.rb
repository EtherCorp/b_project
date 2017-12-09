class Evaluation < ApplicationRecord
  belongs_to :store
  belongs_to :user

  def self.create_with_params(params)
    a = Evaluation.new
    a.user_id = params[:user_id]
    a.store_id = params[:store_id]
    a.value = params[:value]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Evaluation.find_by(id: params[:id])
    a.user_id = params[:user_id]
    a.store_id = params[:store_id]
    a.value = params[:value]
    a.save
    a
	end
end
