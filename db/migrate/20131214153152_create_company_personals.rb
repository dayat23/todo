class CreateCompanyPersonals < ActiveRecord::Migration
  def change
    create_table :company_personals do |t|
      t.integer :company_id
      t.integer :personal_id

      t.timestamps
    end
  end
end
