json.extract! profile, :id, :name, :last_name, :male, :created_at, :updated_at
json.url profile_url(profile, format: :json)
