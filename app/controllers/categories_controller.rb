class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.where(id: params[:id]).preload(:images).first
  end

  def create
    @category = Category.new
    @new_category = @category.build(category_params)
    if @new_category.save
      redirect_to root_url
    else
      render 'categories/index'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end