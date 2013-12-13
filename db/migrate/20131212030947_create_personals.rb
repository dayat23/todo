class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :code_person
      t.string :slug
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
