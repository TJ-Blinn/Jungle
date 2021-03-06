
class Admin::CategoriesController < ApplicationController
  
  http_basic_authenticate_with name: ENV['HTTP_Basic_Authentication_username'], password: ENV['HTTP_Basic_Authentication_password']

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Categories created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end