class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user, :verify_admin_user, only: [:index, :destroy]
  before_action :find_category, only: [:show, :destroy]
  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
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

  def destroy
    @category.destroy
    flash[:success] = t "flash_message.delete_success"
    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end

  private
  def find_category
    @category = Category.find_by id: params[:id]
  end
end
