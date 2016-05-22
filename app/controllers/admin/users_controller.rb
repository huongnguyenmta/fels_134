class Admin::UsersController < ApplicationController
  before_action :logged_in_user, :verify_admin_user

  def index
    @users = User.paginate page: params[:page]
  end
end
