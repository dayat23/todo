class Personal < ActiveRecord::Base
  extend FriendlyId
  friendly_id :generate_custom_slug, use: :slugged

  attr_accessor :company_name
  
  has_many :company
  # has_one :company
  belongs_to :user, dependent: :destroy

  after_create :create_company

  def generate_code_project
    self.code_person ||= loop do
      person_code = rand(1...10000000).to_s
      break person_code unless self.class.exists?(code_person: person_code)
    end
    self.title ||= "#{self.code_person}-#{self.first_name}"
  end

  def generate_custom_slug
    generate_code_project
  end

  def create_company
    Company.create!(personal_id: self.id, name_company: self.company_name)
  end
end
