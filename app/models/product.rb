class Product < ApplicationRecord
    has_and_belongs_to_many :features
    has_and_belongs_to_many :users
    has_many :product_games
    has_many :store_products
end
