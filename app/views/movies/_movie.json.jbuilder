json.extract! movie, :id, :name, :summary, :created_at, :updated_at
json.url movie_url(movie, format: :json)
