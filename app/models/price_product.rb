class PriceProduct < ApplicationRecord
  belongs_to :price 
  belongs_to :product
end 