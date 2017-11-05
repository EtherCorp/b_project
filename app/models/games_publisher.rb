class GamesPublisher < ApplicationRecord
  belongs_to :game
  belongs_to :company
  belongs_to :platform
end
