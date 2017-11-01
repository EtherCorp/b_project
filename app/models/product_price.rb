class ProductPrice < ApplicationRecord
    belongs_to :store_product
    belongs_to :currency
end
