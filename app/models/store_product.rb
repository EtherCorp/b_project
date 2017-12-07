class StoreProduct < ApplicationRecord
  has_many :product_prices
  belongs_to :product
  belongs_to :store


  def self.create_with_params(params)
    store = Store.find_by(name: params[:site])
    products = Product.find_by(name: params[:name])
    a = StoreProduct.new
    a.store_id = store.id
    a.product_id = products.id
    a.url =params[:url]
    a.last_successful_scrap_at = DateTime.now
    a.last_scrapping_attempt_at = DateTime.now
    a.stock = false
    a.enabled = true
    a.save
    a
  end

  def self.update_with_params(params)
    a = StoreProduct.find_by(id: params[:id])
    a.store_id = params[:store_id]
    a.product_id = params[:product_id]
    a.url =params[:product_url]
    a.last_successful_scrap_at =params[:last_successful_scrap_at]
    a.last_scrapping_attempt_at =params[:last_scrapping_attempt_at]
    a.stock = params[:stock]
    a.enabled = enabled[:enabled]
    a.save
    a
	end

end
