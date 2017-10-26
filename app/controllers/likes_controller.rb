class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image

  def create
    @like = @image.likes.build(user: current_user)
    respond_to do |format|
      if @like.save
        format.json { render json: { likes_count: @image.likes.count }, status: :created }
      else
        format.json { render json: { errors: @like.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = Like.find_by(user: current_user, image: @image)
    respond_to do |format|
      if @like.destroy
        format.json { render json: { likes_count: @image.likes.count }, status: :ok }
      else
        format.json { render json: { errors: @like.errors.full_messages }, status: :not_found }
      end
    end
  end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end
end
