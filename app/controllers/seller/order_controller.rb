class Seller::OrderController < SellerController
  def index
    @orders = {}
    @ids ={}
    temp = Purchaser::Order.where(handled:1)
    temp.each do |order|
      buyer_name = order.user.username
      @orders[buyer_name.to_sym]=[]
      @ids[buyer_name.to_sym]=order.id
      order.lists.each do |l|
        @orders[buyer_name.to_sym]<<l if l.product.user == login_user
      end
    end
  end
end
