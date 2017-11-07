class Game < ApplicationRecord
  has_and_belongs_to_many :clasifications
  has_and_belongs_to_many :genres
  has_many :game_alt_names
  has_many :game_asociations
end
