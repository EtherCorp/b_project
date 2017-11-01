class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.decimal :average_evaluation, precision: 10, scale: 2
      t.string :name
      t.string :home_page
      t.timestamps
    end
  end
end
