class Purchaser::HomeController < PurchaserController
  skip_before_action :check_login,only: [:index]
  def index
    @products = Seller::Product.paginate :page => params[:page],
                                          :per_page => 20
    @purchaser_cart = current_cart
  end
end
