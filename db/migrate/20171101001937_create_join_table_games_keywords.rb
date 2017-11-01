class CreateJoinTableGamesKeywords < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :keywords do |t|
      t.index :game_id
      t.index :keyword_id
    end
  end
end
