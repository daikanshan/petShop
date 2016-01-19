class Admin::User < ActiveRecord::Base
  has_secure_password
  has_many :products ,class_name:"Seller::Product"
  has_one :applct

  def discribe
    if self.identity == 0
      "买家"
    elsif self.identity == 1
      "卖家"
    else
      "管理员"
    end
  end
end
