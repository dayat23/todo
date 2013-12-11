class AddTitleToPersonals < ActiveRecord::Migration
  def change
    add_column :personals, :title, :string
  end
end
