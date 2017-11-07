class CreateGameAsociations < ActiveRecord::Migration[5.1]
  def change
    create_table :game_asociations do |t|
      t.references :game
      t.references :product
      t.references :platform
      t.timestamps
    end
  end
end
