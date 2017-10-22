class CreateStore < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.decimal :average_eval
      t.string :store_name
      t.string :url
      t.timestamps
    end
  end
end
