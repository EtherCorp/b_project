class Game < ApplicationRecord
    has_many_and_belongs_to :developers
    has_many_and_belongs_to :products
    has_many_and_belongs_to :platforms
    has_many_and_belongs_to :clasifications
    has_many_and_belongs_to :genres
    has_many_and_belongs_to :keywords
    has_many :game_alt_names
    belogs_to :publisher
end
