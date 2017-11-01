class CreateStoreProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :store_products do |t|
      t.references :store
      t.references :product
      t.text :url
      t.timestamp :last_successful_scrap_at
      t.timestamp :last_scrapping_attempt_at
      t.boolean :stock
      t.timestamps
    end
  end
end
