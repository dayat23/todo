class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name_company
      t.integer :personal_id
      t.string :code_company
      t.string :slug

      t.timestamps
    end
  end
end
