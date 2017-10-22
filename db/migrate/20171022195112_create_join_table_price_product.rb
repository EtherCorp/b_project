class CreateJoinTablePriceProduct < ActiveRecord::Migration[5.1]
  def change
    create_join_table :prices, :products do |t|
      t.index :price_id
      t.index :product_id
      t.timestamps
    end
  end
end
