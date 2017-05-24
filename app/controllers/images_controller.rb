class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_image, only: [ :show, :edit, :update, :destroy]

  def index
    @images = Image.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC').page(params[:page])
  end

  def show
    @image = Image.includes(:likes, :comments).find(params[:id])
  end

  def edit
  end

  def create
    @category = Category.find(params[:category_id])
    @image = @category.images.build(image_params)
    if @image.save
      flash[:success] = 'Uploaded'
    else
      flash[:error] = 'Could not upload file. Please choose it!'
    end
    redirect_to category_path(@category.id)
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
    @image.destroy
    flash[:success] = 'Image deleted.'
    redirect_to category_path(@image.category_id)
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :category_id, {pictures: []})
  end

end
