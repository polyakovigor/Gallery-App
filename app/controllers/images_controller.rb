class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [ :show, :edit, :update, :destroy]

  def index
    @images = Image.all.page(params[:page])
  end

  def show
    @image = Image.includes(:likes, :comments).find_by(id: params[:id])
    @like = Like.new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @category = Category.find(params[:category_id])
    if @category.update(category_image_params)
      flash[:success] = 'Uploaded'
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
    @image = Image.where(id: params[:id]).first
  end

  def image_params
    params.require(:image).permit(:title)
  end

  def category_image_params
    params.require(:category).permit(:id, images_attributes: [:picture, :title])
  end

end
