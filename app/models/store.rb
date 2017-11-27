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
end
