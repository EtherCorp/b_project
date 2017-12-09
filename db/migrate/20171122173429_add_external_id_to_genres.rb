class AddExternalIdToGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :genres, :external_id, :integer
  end
end
