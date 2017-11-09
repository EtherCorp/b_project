class CreateInvolvedCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :involved_companies do |t|
      t.references :game_asociation
      t.references :company
      t.references :company_role
      t.timestamps
    end
  end
end
