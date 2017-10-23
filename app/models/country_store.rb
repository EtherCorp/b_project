class CountryStore < ApplicationRecord
  belongs_to :store 
  belongs_to :country
end 