json.array!(@projects) do |project|
  json.extract! project, :id, :name_project, :company_id, :slug, :title, :code_project
  json.url project_url(project, format: :json)
end
