class StoreProduct < ApplicationRecord
    has_many :product_prices
    belongs_to :product
    belongs_to :store
end
