class Game < ApplicationRecord
  belongs_to :developer
  has_many :game_clasifications
  has_many :game_products
  has_many :category_games
  has_many :game_keywords
end
