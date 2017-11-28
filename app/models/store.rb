class Store < ApplicationRecord
  has_and_belongs_to_many :countries
  has_many :store_products
  has_many :evaluations
  has_many :store_logs

  def check_page
    status = Monitoring::Connection.check(home_page)
    store_logs << StoreLog.create(online: status)
    status
  end

  def self.create_with_params(params)
    a = Store.new
    a.name = params[:name]
    a.home_page = params[:home_page]
    a.average_evaluation =params[:average_evaluation]
    a.save
    a
  end

  def self.update_with_params(params)
    a = Store.find_by(id: params[:id])
    a.name = params[:name]
    a.home_page = params[:home_page]
    a.average_evaluation =params[:average_evaluation]
    a.save
    a
	end

end
