json.array!(@users) do |user|
  json.extract! user, :id, :uid, :date
  json.url user_url(user, format: :json)
end
