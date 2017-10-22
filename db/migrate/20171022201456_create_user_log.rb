class CreateUserLog < ActiveRecord::Migration[5.1]
  def change
    create_table :user_logs do |t|
      t.references :action
      t.references :user
      t.json :affected_items
      t.timestamps
    end
  end
end
