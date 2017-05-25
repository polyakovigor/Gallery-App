class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :image, only: [ :show, :edit, :update, :destroy]

  def index
    @images = Image.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC').page(params[:page])
  end

  def show
  end

  def new
    @image = category.images.new
  end

  def create
    @image = category.images.build(image_params)
    if @image.save
      flash[:success] = 'Uploaded'
      redirect_to category_path(category)
    else
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
      render :edit
    end
  end

  def destroy
    @image.destroy
    flash[:success] = 'Image deleted.'
    redirect_to category_path(@image.category_id)
  end

  private

  def category
    @category = Category.find(params[:category_id])
  end

  def image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :picture)
  end

end
