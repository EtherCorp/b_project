class User < ApplicationRecord
  has_and_belongs_to_many :products
  has_and_belongs_to_many :roles
  has_many :evaluations
  has_many :user_logs
  belongs_to :country



  def self.create_with_params(params)
    a = User.new
    a.country_id = params[:country_id]
    a.username = params[:username]
    a.password = params[:password]
    a.encrypted_password = params[:encrypted_password]
    a.email = params[:email]
    a.save
    a
  end

  def self.update_with_params(params)
    a = User.find_by(id: params[:id])
    a.country_id = params[:country_id]
    a.username = params[:username]
    a.password = params[:password]
    a.encrypted_password = params[:encrypted_password]
    a.email = params[:email]
    a.save
    a
	end



end
