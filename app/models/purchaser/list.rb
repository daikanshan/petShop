class Purchaser::List < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product ,class_name:"Seller::Product"
end
