json.array!(@acmos) do |acmo|
  json.extract! acmo, :id, :actor_id, :movie_id
  json.url acmo_url(acmo, format: :json)
end
