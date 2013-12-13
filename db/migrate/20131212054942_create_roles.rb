class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name_role
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
