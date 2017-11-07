class Product < ApplicationRecord
  has_and_belongs_to_many :features
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tags
  has_many :game_asociations
  has_many :store_products
end
