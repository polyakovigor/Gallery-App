class LikesController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :destroy ]
  before_action :set_image, only: [ :create, :destroy ]

  def create
    @like = @image.likes.create!(likes_params)
    respond_to do |format|
      format.html { redirect_to @image }
      format.js
    end
  end

  def destroy
    @image.likes.where(user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to @image }
      format.js
    end
  end

  private

  def set_image
    @image = Image.params(:image_id)
  end

  def likes_params
    params.require(:like).permit(:image_id, :user_id)
  end
end
