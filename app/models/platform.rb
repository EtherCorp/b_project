class Platform < ApplicationRecord
  has_many :games_developers
  has_many :games_publishers
  has_many :games, through: :games_developers
  has_many :developers, -> { distinct }, through: :games_developers, source: :company
  has_many :publishers, -> { distinct }, through: :games_publishers, source: :company
end
