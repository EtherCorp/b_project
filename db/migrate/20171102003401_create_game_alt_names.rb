class CreateGameAltNames < ActiveRecord::Migration[5.1]
  def change
    create_table :game_alt_names do |t|
      t.references :game
      t.string :name
      t.timestamps
    end
  end
end
