class CreateGamesDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :games_developers do |t|
      t.references :game
      t.references :company
      t.references :platform
      t.timestamps
    end
  end
end
