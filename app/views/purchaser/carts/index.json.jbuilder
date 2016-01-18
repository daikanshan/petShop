json.array!(@purchaser_carts) do |purchaser_cart|
  json.extract! purchaser_cart, :id
  json.url purchaser_cart_url(purchaser_cart, format: :json)
end
