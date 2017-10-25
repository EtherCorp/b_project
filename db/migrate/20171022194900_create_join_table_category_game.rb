class CreateJoinTableCategoryGame < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :games do |t|
      t.index :category_id
      t.index :game_id
      t.timestamps
    end
  end
end
