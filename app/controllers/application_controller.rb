class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      store_location
      flash[:success] = t "edit_users.please_login"
      redirect_to login_url
    end
  end

  def verify_logged_in_user
    @user = User.find params[:id]
    redirect_to root_url unless @user.is_user? current_user
  end

  def verify_admin_user
    flash[:success] = t "flash_message.admin_user"
    redirect_to root_path unless current_user.admin?
  end
end
