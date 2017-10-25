class CreateClasification < ActiveRecord::Migration[5.1]
  def change
    create_table :clasifications do |t|
      t.references :normative
      t.string :code
      t.string :details
      t.timestamps
    end
  end
end
