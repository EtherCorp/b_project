class CreateJoinTablePriceProduct < ActiveRecord::Migration[5.1]
  def change
    create_join_table :prices, :products do |t|
      t.index :price_id
      t.index :product_id
      t.decimal :normal_price
      t.decimal :current_price
      t.timestamp :flash_deal_ends_at
      t.timestamps
    end
  end
end
