class Admin::User < ActiveRecord::Base
  has_secure_password
  has_many :products ,class_name:"Seller::Product"
end
