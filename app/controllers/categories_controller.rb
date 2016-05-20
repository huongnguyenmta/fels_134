class CategoriesController < ApplicationController
  before_action :logged_in_user
  def new
  end

  def index
    @categories = Category.paginate page: params[:page]
  end
end
