class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :developer_id
      t.string :game_name
      t.date :release_date
      t.text :description

      t.timestamps
    end
  end
end
