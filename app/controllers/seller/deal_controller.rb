class Seller::DealController < SellerController
  def result

  end

  def sendout
    current_user = login_user
    order = Purchaser::Order.find_by_id(params[:id])
    order.handled = 3#已发货
    order.save
    current_user.money+=order.total_price
    current_user.save
    render 'result'
  end
end
