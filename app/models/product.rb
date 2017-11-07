class Product < ApplicationRecord
  has_and_belongs_to_many :features
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tags
  has_many :game_asociations
  has_many :store_products


  def self.create_with_params(params)
    a = Product.new
    a.name = params[:name]
    a.details = params[:details]
    a.release_date = params[:release_date]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Product.find_by(id: params[:id])
    a.name = params[:name]
    a.details = params[:details]
    a.release_date = params[:release_date]
    a.save
    a
	end

end
