class Personal < ActiveRecord::Base
  extend FriendlyId
  friendly_id :generate_custom_slug, use: :slugged

  attr_accessor :company_name
  
  has_many :company_personals
  # has_one :company
  belongs_to :user, dependent: :destroy

  after_create :create_company_and_company_personal

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

  def create_company_and_company_personal
    @company = Company.create!(name_company: self.company_name)
    CompanyPersonal.create!(company_id: @company.id, personal_id: self.id)
  end
end
