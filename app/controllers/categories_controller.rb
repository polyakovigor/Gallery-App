class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.where(id: params[:id]).first
    @images = @category.images.page(params[:page])
  end

  def create
    @category = current_user.categories.create(category_params)
    if @category.save
      redirect_to root_url
    else
      render 'categories/index'
    end
  end

  def destroy
    if @category = Category.find_by(id: params[:id])
       @category.destroy
       flash[:success] = 'Category deleted.'
    else
      flash[:error] = 'Category not found.'
    end
    redirect_to root_url
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end