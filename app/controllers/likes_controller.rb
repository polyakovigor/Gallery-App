class LikesController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :destroy ]
  before_action :set_image, only: [ :create, :destroy ]

  def create
    @image.likes.create(user_id: current_user.id)
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
    @image = Image.where(id: params[:id]).first
  end
end
