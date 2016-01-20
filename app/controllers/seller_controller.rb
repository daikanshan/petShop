class SellerController < ApplicationController
  before_action :check_seller

  private
  def check_seller
    if !login_user||login_user.identity!=1
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json { head :no_content }
      end
    end
  end
end
