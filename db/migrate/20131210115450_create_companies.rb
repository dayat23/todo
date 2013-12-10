class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :full_name
      t.string :name_company
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
