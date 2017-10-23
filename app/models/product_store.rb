class ProductStore  < ApplicationRecord
  has_many :product_prices
  belongs_to :products
  belongs_to :stores
end 