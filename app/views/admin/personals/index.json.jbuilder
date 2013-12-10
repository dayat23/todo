json.array!(@personals) do |personal|
  json.extract! personal, :first_name, :last_name, :photo
  json.url personal_url(personal, format: :json)
end