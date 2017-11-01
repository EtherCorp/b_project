class CreateJoinTableGamesDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :developers do |t|
      t.index :game_id
      t.index :developer_id
    end
  end
end
