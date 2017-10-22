class CreateJoinTableProductStores < ActiveRecord::Migration[5.1]
  def change
    create_join_table :products, :stores do |t|
      t.index :product_id
      t.index :store_id
    end
  end
end
