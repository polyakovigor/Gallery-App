class CategoriesController < ApplicationController

  def index
    @categories = Category.all.preload(:images)
  end

  def show
    @category = Category.where(id: params[:id]).first
    @images = @category.images.page(params[:page])
  end

  def create
    @category = current_user.categories.create(category_params)
    @category.user_id = current_user.id if current_user
    @category.save
    if @category.save
      flash[:success] = 'Category created.'
    else
      flash[:error] = @category.errors.full_messages
    end
    redirect_to root_path
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