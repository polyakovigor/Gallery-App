class ImagesController < ApplicationController

  def show
    @image = Image.find(params[:id])
  end

  def edit

  end

  def destroy
    Image.find(params[:id]).destroy
    flash[:success] = 'Image deleted.'
    redirect_to category_url
  end
end
