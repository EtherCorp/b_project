class ProductPrice < ApplicationRecord
  belongs_to :store_product
  belongs_to :currency


  def self.create_with_params(params)
    a = ProductPrice.new
    product_store= StoreProduct.find_by(url: params[:url])
    a.store_product_id = product_store.id
    a.currency_id = Currency.find_by(symbol: "CLP").id
    a.normal_price = params[:price]
    a.current_price = params[:current_price]
    a.flash_deal_ends_at = params[:flash_deal_ends_at]
    a.save
    a
  end

  def self.update_with_params(params)
    a = ProductPrice.find_by(id: params[:id])
    a.product_store_id = params[:product_store_id]
    a.currency_id = params[:currency_id]
    a.normal_price = params[:normal_price]
    a.current_price = params[:current_price]
    a.flash_deal_ends_at = params[:flash_deal_ends_at]
    a.save
    a
	end


end
