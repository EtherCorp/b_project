class CreateJoinTableClasificationsGames < ActiveRecord::Migration[5.1]
  def change
    create_join_table :clasifications, :games do |t|
      t.index :clasification_id
      t.index :game_id
    end
  end
end
