class CreateUserLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_logs do |t|
      t.references :user
      t.references :action
      t.text :details
      t.timestamps
    end
  end
end
