module ApplicationHelper
  def login_user
    if !session[:user_id].nil?
      Admin::User.find_by_id(session[:user_id])
    else
      nil
    end
  end
  def login_admin
    if login_user && login_user.identity==2
      login_user
    else
      nil
    end
  end
end
