class PurchaserController < ApplicationController
  
  private
  def current_cart
    Purchaser::Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Purchaser::Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
