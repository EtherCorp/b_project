class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          # :confirmable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :evaluations
  belongs_to :country
  has_many :user_logs
  has_many :user_roles
  has_many :wishlists
end
