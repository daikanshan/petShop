json.array!(@seller_products) do |seller_product|
  json.extract! seller_product, :id, :name, :price, :img_url, :verified
  json.url seller_product_url(seller_product, format: :json)
end
