class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def create
    @category = Category.find(params[:category_id])
    respond_to do |format|
      if @category.update(category_image_params)
        format.html { redirect_to category_url(@category.id), success: 'Images uploaded' }
        format.js   {}
        format.json { render json: category_url(@category.id), status: :created, location: category_url(@category.id) }
        # flash[:success] = 'Images uploaded'
      else
        format.html { redirect_to category_url(@category.id), success: 'Could not upload file. Please choose it!' }
        format.json { render json: category_url(@category.id).errors, status: :unprocessable_entity }
        # flash[:error] = 'Could not upload file. Please choose it!'
      end
    end
    # redirect_to category_url(@category.id)
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
