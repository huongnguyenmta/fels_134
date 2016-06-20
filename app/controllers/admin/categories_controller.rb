class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user, :verify_admin_user

  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
    @category = Category.find_by id: params[:id]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "Course.create_success"
      redirect_to :back
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end
end
