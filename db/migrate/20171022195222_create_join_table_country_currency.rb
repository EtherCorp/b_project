class CreateJoinTableCountryCurrency < ActiveRecord::Migration[5.1]
  def change
    create_join_table :countries, :currencies do |t|
      t.index :country_id
      t.index :currency_id
      t.timestamps
    end
  end
end
