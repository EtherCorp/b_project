class Company < ApplicationRecord
  has_many :games_developers
  has_many :games_publishers
  has_many :platforms_developed, -> { distinct }, through: :games_developers, source: :platform
  has_many :platforms_published, -> { distinct }, through: :games_publishers, source: :platform
  has_many :games_developed, -> { distinct }, through: :games_developers, source: :game
  has_many :games_published, -> { distinct }, through: :games_publishers, source: :game
end
