class Purchaser::ModifyController < PurchaserController
  def index
    @admin_user = login_user
  end
  def update
    @admin_user = login_user
    modify_params = {
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    }
    @result = @admin_user.update(modify_params)
    render "result"
  end
end
