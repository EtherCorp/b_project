class Currency < ApplicationRecord
    has_and_belongs_to_many :countries
    has_many :product_prices
end
