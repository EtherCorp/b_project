class Game < ApplicationRecord
    has_and_belongs_to_many :developers
    has_and_belongs_to_many :products
    has_and_belongs_to_many :platforms
    has_and_belongs_to_many :clasifications
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :keywords
    has_many :game_alt_names
    belongs_to :publisher
end
