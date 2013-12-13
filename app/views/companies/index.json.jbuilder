json.array!(@companies) do |company|
  json.extract! company, :id, :name_company, :personal_id, :code_company, :slug
  json.url company_url(company, format: :json)
end
