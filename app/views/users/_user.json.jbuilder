json.extract! user, :id, :username, :email, :passaword, :created_at, :updated_at
json.url user_url(user, format: :json)
