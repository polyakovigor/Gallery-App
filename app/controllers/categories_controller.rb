class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.where(id: params[:id]).preload(:images).first
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to root_url
    else
      render 'categories/index'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = 'Category deleted.'
    redirect_to root_url
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end