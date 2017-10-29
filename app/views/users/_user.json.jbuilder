json.extract! user, :id, :email, :passwd, :created_at, :updated_at
json.url user_url(user, format: :json)
