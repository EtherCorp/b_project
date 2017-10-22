class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :plataform
      t.string :name
      t.text :aditional_details
    end
  end
end
