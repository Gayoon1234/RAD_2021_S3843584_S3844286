json.extract! safe, :id, :name, :username, :created_at, :updated_at
json.url safe_url(safe, format: :json)
