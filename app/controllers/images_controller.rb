class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def create
    @category = Category.find(params[:category_id])
    begin
      Image.create_pictures(params[:image][:picture], @category)
      flash[:success] = 'Image'.pluralize + ' uploaded'
      redirect_to category_url(@category.id)
    rescue Exception
      flash[:massage] = 'Error: Could not upload file'.pluralize
      render 'categories/show'
    end
  end

  def update
    if @image.update_attributes(image_params)
      flash[:success] = 'Image updated.'
      redirect_to @image
    else
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
end
