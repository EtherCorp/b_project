class CreateJoinTableGamesProducts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :products do |t|
      t.index :game_id
      t.index :product_id
    end
  end
end
