class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_user
    if !session[:user_id].nil?
      Admin::User.find_by_id(session[:user_id])
    else
      nil
    end
  end

  private
  def current_cart
    Purchaser::Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Purchaser::Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
