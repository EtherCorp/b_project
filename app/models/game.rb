class Game < ApplicationRecord
  has_and_belongs_to_many :products
  has_and_belongs_to_many :clasifications
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :keywords
  has_many :game_alt_names
  has_many :games_developers
  has_many :games_publishers
  has_many :platforms, -> { distinct }, through: :games_developers
  has_many :developers, -> { distinct }, through: :games_developers, source: :company
  has_many :publishers, -> { distinct }, through: :games_publishers, source: :company
end
