class CountryCurrency < ApplicationRecord
  belongs_to :currency 
  belongs_to :country
end 