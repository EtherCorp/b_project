class User < ApplicationRecord
    has_and_belongs_to_many :products
    has_and_belongs_to_many :roles
    has_many :evaluations
    has_many :user_logs
    belongs_to :country
end
