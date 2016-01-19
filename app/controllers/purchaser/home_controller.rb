class Purchaser::HomeController < PurchaserController
  def index
    @products = Seller::Product.all
    @purchaser_cart = current_cart
  end
end
