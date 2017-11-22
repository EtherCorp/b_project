class Platform < ApplicationRecord
  has_many :game_asociations

  def self.create_with_params(params)
    a = Platform.new
    a.name = params[:name]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Platform.find_by(id: params[:id])
    a.name = params[:name]
    a.save
    a
	end
end
