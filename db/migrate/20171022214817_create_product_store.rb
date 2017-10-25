class CreateProductStore < ActiveRecord::Migration[5.1]
  def change
    create_table :product_stores do |t|
      t.references :product_id
      t.references :store_id
      t.text :product_url
      t.boolean :stock
      t.timestamp :last_scrapping_attempt
      t.timestamps
    end
  end
end
