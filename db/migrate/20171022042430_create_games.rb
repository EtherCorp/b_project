class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :developer
      t.string :name
      t.date :release_date
      t.text :description

      t.timestamps
    end
  end
end
