class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :developer, foreign_key: true
      t.string :name, limit: 30
      t.date :release_date
      t.text :description, null: true

      t.timestamps
    end
  end
end
