class Country < ApplicationRecord
  belongs_to :normative 
  has_many :users
  has_many :country_stores
  has_many :country_currencies
end 