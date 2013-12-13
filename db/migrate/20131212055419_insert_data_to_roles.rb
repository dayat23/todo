class InsertDataToRoles < ActiveRecord::Migration
  def change
  	Role.create!(
  		name_role: "Registrated"
  	)
  	Role.create!(
  		name_role: "Team"
  	)
  end
end
