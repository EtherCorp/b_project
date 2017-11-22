class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.references :user
      t.references :store
      t.integer :value
      t.timestamps
    end
  end
end
