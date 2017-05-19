class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image

  def create
    @image.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @image }
      format.js
    end
  end

  def destroy
    @image.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @image }
      format.js
    end
  end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end
end
