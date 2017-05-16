class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all.preload(:images)
  end

  def show
    @category = Category.find(params[:id])
    @images = @category.images.page(params[:page])
  end

  def create
    @category = current_user.categories.create(category_params)
    if @category.save
      flash[:success] = 'Category created. Now you can add some images.'
      redirect_to category_path(@category)
    else
      flash[:error] = @category.errors.full_messages
      redirect_to root_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = 'Category deleted.'
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end