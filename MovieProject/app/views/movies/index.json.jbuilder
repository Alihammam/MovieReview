json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :description, :length, :director_id
  json.url movie_url(movie, format: :json)
end
