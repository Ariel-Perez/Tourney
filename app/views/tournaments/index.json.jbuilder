json.array!(@tournaments) do |tournament|
  json.extract! tournament, :name
  json.url tournament_url(tournament, format: :json)
end
