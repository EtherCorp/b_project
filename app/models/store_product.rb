class StoreProduct < ApplicationRecord
  has_many :product_prices
  belongs_to :product
  belongs_to :store


  def self.create_with_params(params)
    a = StoreProduct.new
    a.store_id = params[:store_id]
    a.product_id = params[:product_id]
    a.product_url =params[:product_url]
    a.last_successful_scrap_at =params[:last_successful_scrap_at]
    a.last_scrapping_attempt_at =params[:last_scrapping_attempt_at]
    a.stock = params[:stock]
    a.enabled = enabled[:enabled]
    a.save
    a
  end

  def self.update_with_params(params)
    a = StoreProduct.find_by(id: params[:id])
    a.store_id = params[:store_id]
    a.product_id = params[:product_id]
    a.product_url =params[:product_url]
    a.last_successful_scrap_at =params[:last_successful_scrap_at]
    a.last_scrapping_attempt_at =params[:last_scrapping_attempt_at]
    a.stock = params[:stock]
    a.enabled = enabled[:enabled]
    a.save
    a
	end

end
