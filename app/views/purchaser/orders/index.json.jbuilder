json.array!(@purchaser_orders) do |purchaser_order|
  json.extract! purchaser_order, :id
  json.url purchaser_order_url(purchaser_order, format: :json)
end
