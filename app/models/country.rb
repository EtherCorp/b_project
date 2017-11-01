class Country < ApplicationRecord
    has_and_belongs_to_many :currencies
    has_and_belongs_to_many :stores
    has_many :users
    belongs_to :normative
    
end
