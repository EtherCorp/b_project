class Product < ApplicationRecord
  belongs_to :platform
  has_many :wishlists
  has_many :product_stores
  has_many :game_products
end
