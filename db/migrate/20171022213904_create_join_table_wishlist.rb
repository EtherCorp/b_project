class CreateJoinTableWishlist < ActiveRecord::Migration[5.1]
  def change
    create_join_table :products, :users do |t|
      t.index :product_id
      t.index :user_id
      t.timestamps
    end
  end
end
