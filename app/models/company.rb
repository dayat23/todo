class Company < ActiveRecord::Base
	has_many :projects
	belongs_to :admin_user
end
