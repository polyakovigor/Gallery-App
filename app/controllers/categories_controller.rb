class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.where(id: params[:id]).preload(:images).first
  end
end