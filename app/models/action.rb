class Action < ApplicationRecord
  has_many :user_logs

  def self.create_with_params(params)
    a = Action.new
    #a.publisher_id = params[:publisher_id]
    a.name = params[:name]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Game.find_by(id: params[:id])
    a.name = params[:name]
    a.save
    a
	end

end
