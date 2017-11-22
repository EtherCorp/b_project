class GameAltName < ApplicationRecord
  belongs_to :game

  def self.create_with_params(params)
    a = GameAltName.new
    a.name = params[:name]
    a.game_id = params[:game_id]
    a.save
    a
  end

  def self.update_with_params(params)
    a = GameAltName.find_by(id: params[:id])
    a.name = params[:name]
    a.game_id = params[:game_id]
    a.save
    a
	end

end
