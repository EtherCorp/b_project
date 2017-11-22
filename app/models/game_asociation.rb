class GameAsociation < ApplicationRecord
  has_many :involved_companies
  belongs_to :game
  belongs_to :product
  belongs_to :platform

end
