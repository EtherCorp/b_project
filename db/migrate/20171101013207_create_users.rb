class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :country
      t.string :username
      t.string :password
      t.string :encrypted_password
      t.string :email
      t.timestamps
    end
  end
end
