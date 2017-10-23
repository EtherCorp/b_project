class Clasification < ApplicationRecord
  belongs_to :normative 
  has_many :clasification_games
end 