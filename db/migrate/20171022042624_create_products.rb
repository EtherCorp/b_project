class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :plataform, foreign_key: true
      t.string :name, limit: 80
      t.text :aditional_details, null:true

      t.timestamps
    end
  end
end
