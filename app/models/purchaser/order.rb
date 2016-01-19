class Purchaser::Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user,class_name:"Admin::User"
  has_many :lists

  def total_price
    lists.to_a.sum{|item| item.total_price}
  end
end
