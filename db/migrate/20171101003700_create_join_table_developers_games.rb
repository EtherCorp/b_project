class CreateJoinTableDevelopersGames < ActiveRecord::Migration[5.1]
  def change
    create_join_table :developers, :games do |t|
      t.index :developer_id
      t.index :game_id
    end
  end
end
