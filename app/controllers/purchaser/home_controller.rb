class Purchaser::HomeController < PurchaserController
  def index
    @products = Seller::Product.paginate :page => params[:page],
                                          :per_page => 20
    @purchaser_cart = current_cart
  end
end
