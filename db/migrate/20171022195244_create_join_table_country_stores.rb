class CreateJoinTableCountryStores < ActiveRecord::Migration[5.1]
  def change
    create_join_table :countries, :stores do |t|
      t.index :country_id
      t.index :store_id
      t.timestamps
    end
  end
end
