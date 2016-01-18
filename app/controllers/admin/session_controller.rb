class Admin::SessionController < ApplicationController
  skip_before_action :check_login
  layout false
  def new

  end

  def create
    prms = params.permit(:username, :password)
    user = Admin::User.find_by_username(prms[:username])
    
    if user && user.authenticate(prms[:password])
      session[:user_id] = user.id
      session[:username] = user.username
      if user.identity==0
        redirect_to root_path
      elsif user.identity==1
        redirect_to seller_path
      elsif user.identity==2
        redirect_to admin_path
      else
        redirect_to  login_path
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = session[:username] = nil
    redirect_to root_path
  end
end
