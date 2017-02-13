class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @image.update_attributes(image_params)
      flash[:success] = 'Image updated'
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
    params.require(:image).permit(:title, :picture)
  end
end
