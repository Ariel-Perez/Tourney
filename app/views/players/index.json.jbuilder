json.array!(@players) do |player|
  json.extract! player, :nick, :first_name, :last_name, :role, :nationality, :birth_date, :email, :password_digest
  json.url player_url(player, format: :json)
end
