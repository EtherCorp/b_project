class CreateStoreLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :store_logs do |t|
      t.references :store
      t.boolean :online
      t.timestamps
    end
  end
end
