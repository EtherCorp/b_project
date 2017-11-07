class Game < ApplicationRecord
  has_and_belongs_to_many :clasifications
  has_and_belongs_to_many :genres
  has_many :game_alt_names
  has_many :game_asociations

  def self.create_with_params(params)
    a = Game.new
    a.publisher_id = params[:publisher_id]
    a.name = params[:name]
    a.description = params[:description]
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
