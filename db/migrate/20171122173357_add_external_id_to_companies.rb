class AddExternalIdToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :external_id, :integer
  end
end
