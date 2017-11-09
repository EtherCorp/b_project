class CreateIgdbKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :igdb_keys do |t|
      t.string :key
      t.datetime :last_used
      t.boolean :is_active
      t.string :owner_email
      t.string :key_class
      
      t.timestamps
    end
  end
end

