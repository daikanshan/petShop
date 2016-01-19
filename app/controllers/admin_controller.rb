class AdminController < ApplicationController
  before_action :check_admin

  private
  def check_admin
    if !login_user || login_user.identity<2
      respond_to do |format|
        format.html { redirect_to login_path}
        format.json { head :no_content }
      end
    end
  end
end
