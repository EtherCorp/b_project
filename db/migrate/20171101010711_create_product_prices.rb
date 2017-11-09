class CreateProductPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :product_prices do |t|
      t.references :store_product
      t.references :currency
      t.decimal :normal_price, precision: 10, scale: 2
      t.decimal :current_price, precision: 10, scale: 2
      t.timestamp :flash_deal_ends_at
      t.timestamps
    end
  end
end
