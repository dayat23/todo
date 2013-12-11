class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :generate_custom_slug, use: :slugged
  
  belongs_to :company

  # before_create :generate_code_project

  def generate_code_project
  	self.code_project ||= loop do
      project_code = rand(1...10000000).to_s
      break project_code unless self.class.exists?(code_project: project_code)
    end
    self.title ||= "#{self.code_project}-#{self.name_project}"
  end

  def generate_custom_slug
  	generate_code_project
  end
end
