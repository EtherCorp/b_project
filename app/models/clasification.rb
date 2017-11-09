class Clasification < ApplicationRecord
  has_and_belongs_to_many :games
  belongs_to :normative
end
