json.array!(@projects) do |project|
  json.extract! project, :name_project, :company_id
  json.url project_url(project, format: :json)
end