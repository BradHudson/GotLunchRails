json.array!(@votes) do |vote|
  json.extract! vote, :id, :name, :vote, :date
  json.url vote_url(vote, format: :json)
end
