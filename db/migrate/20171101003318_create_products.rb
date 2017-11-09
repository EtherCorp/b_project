class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :details
      t.date :release_date
      t.timestamps
    end
  end
end
