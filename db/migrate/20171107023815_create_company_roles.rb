class CreateCompanyRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :company_roles do |t|
      t.string :name
      t.timestamps
    end
  end
end
