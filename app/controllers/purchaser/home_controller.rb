class Purchaser::HomeController < PurchaserController
  def index
    @products = Seller::Product.all
  end
end
