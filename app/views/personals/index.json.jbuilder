json.array!(@personals) do |personal|
  json.extract! personal, :id, :first_name, :last_name, :photo, :code_person, :slug, :title, :user_id
  json.url personal_url(personal, format: :json)
end
