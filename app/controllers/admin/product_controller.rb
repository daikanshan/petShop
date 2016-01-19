class Admin::ProductController < AdminController
  def index
    @products = Seller::Product.paginate(page:params[:page],per_page:10)
  end
end
