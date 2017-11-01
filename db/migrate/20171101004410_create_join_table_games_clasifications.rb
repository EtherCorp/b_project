class CreateJoinTableGamesClasifications < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :clasifications do |t|
      t.index :game_id
      t.index :clasification_id
    end
  end
end
