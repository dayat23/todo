json.array!(@companies) do |company|
  json.extract! company, :full_name, :name_company, :admin_user_id
  json.url company_url(company, format: :json)
end