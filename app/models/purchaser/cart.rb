class Purchaser::Cart < ActiveRecord::Base
  has_many :lists
  has_one :order

  def add_product(product_id)
    current_list = lists.find_by_product_id(product_id)
    if current_list
      current_list.quantity += 1
    else
      current_list = lists.build(:product_id => product_id)
    end
    current_list
  end

  def total_price
    lists.to_a.sum{|item| item.total_price}
  end
end
