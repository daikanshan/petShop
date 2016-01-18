json.array!(@purchaser_lists) do |purchaser_list|
  json.extract! purchaser_list, :id
  json.url purchaser_list_url(purchaser_list, format: :json)
end
