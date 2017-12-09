class Currency < ApplicationRecord
    has_and_belongs_to_many :countries
    has_many :product_prices


    def self.create_with_params(params)
    a = Currency.new
    a.name = params[:name]
    a.symbol = params[:symbol]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Currency.find_by(id: params[:id])
    a.name = params[:name]
    a.symbol = params[:symbol]
    a.save
    a
	end

end
