class CreateJoinTableCountriesCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_join_table :countries, :currencies do |t|
      t.index :country_id
      t.index :currency_id
    end
  end
end
