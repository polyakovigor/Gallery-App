class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def create
    p '*'*100
    p category_image_params
    p '*'*100
    @category = Category.find(params[:category_id])
    if @category.update(category_image_params)
      flash[:success] = 'Images uploaded'
    else
      flash[:error] = 'Could not upload file. Please choose it!'
    end
    redirect_to category_url(@category.id)
  end

  def update
    if @image.update_attributes(image_params)
      flash[:success] = 'Image updated.'
      redirect_to @image
    else
      flash[:error] = @image.errors.full_messages
      render :edit
    end
  end

  def destroy
    category_id = @image.category_id
    @image.destroy
    flash[:success] = 'Image deleted.'
    redirect_to category_url(category_id)
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title)
  end

  def category_image_params
    params.require(:category).permit(:id, images_attributes: [:picture, :title])
  end
end
