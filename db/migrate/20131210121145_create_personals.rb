class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :slug
      t.string :code_personal

      t.timestamps
    end
  end
end
