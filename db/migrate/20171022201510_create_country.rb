class CreateCountry < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.references :normative
      t.string :name
      t.timestamps
    end
  end
end
