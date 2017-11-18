class CreateApiStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :api_statuses do |t|
      t.references :game_api, foreign_key: true
      t.string :status
      t.integer :games
      t.integer :companies
      t.integer :genres
      t.integer :platforms

      t.timestamps
    end
  end
end
