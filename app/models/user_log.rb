class UserLog < ApplicationRecord
  belongs_to :user
  belongs_to :action

  def self.create_with_params(params)
    a = UserLog.new
    a.user_id = params[:user_id]
    a.action_id = params[:action_id]
    a.details = params[:details]
    a.save
    a
  end

  def self.update_with_params(params)
    a = UserLog.find_by(id: params[:id])
    a.user_id = params[:user_id]
    a.action_id = params[:action_id]
    a.details = params[:details]
    a.save
    a
	end



end
