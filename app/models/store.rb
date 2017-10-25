class Store < ApplicationRecord
  has_many :evaluations
  has_many :product_stores
  has_many :country_stores
end 