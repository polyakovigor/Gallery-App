class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_image, only: [ :show, :edit, :update, :destroy]
  before_action :set_category, only: [ :new, :create, :destroy ]

  def index
    @images = Image.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC').page(params[:page])
  end

  def show
  end

  def new
    @image = @category.images.new
  end

  def create
    @image = @category.images.build(image_params)
    if @image.save
      flash[:success] = 'Uploaded'
      redirect_to category_path(@category)
    else
      flash[:error] = @image.errors.full_messages
      render :new
    end
  end

  def edit
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
    redirect_to category_path(@category)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :picture, :picture_cache)
  end
end
