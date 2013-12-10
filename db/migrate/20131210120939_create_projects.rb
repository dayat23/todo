class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name_project
      t.integer :company_id
      t.string :slug
      t.string :code_project

      t.timestamps
    end
  end
end
