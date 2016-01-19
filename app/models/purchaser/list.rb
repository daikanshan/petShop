class Purchaser::List < ActiveRecord::Base
  belongs_to :cart
  belongs_to :order
  belongs_to :product ,class_name:"Seller::Product"
  def total_price
    product.price * quantity
  end
end
