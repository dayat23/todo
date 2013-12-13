class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :generate_custom_slug, use: :slugged

  belongs_to :personal

  def generate_code_project
    self.code_company ||= loop do
      company_code = rand(1...10000000).to_s
      break company_code unless self.class.exists?(code_company: company_code)
    end
  end

  def generate_custom_slug
    generate_code_project
  end
end
