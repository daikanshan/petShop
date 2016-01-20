class PurchaserController < ApplicationController
  before_action :check_login
  private
  def current_cart
    Purchaser::Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Purchaser::Cart.create
    session[:cart_id] = cart.id
    cart
  end
  def check_login
    if !login_user
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json { head :no_content }
      end
    end
  end
end
