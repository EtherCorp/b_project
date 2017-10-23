class Currency < ApplicationRecord
  has_many :price_products
  has_many :country_currencies
end 