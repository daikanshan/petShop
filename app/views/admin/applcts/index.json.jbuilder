json.array!(@admin_applcts) do |admin_applct|
  json.extract! admin_applct, :id, :identity
  json.url admin_applct_url(admin_applct, format: :json)
end
