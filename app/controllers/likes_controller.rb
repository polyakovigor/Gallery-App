class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image

  def create
    @like = @image.likes.build(user: current_user)
    if @like.save
      respond_to do |format|
        format.html do
          flash[:notice] = 'Like created!'
          redirect_to @image
        end
        format.json { render json: { likes_count: @image.likes.count }, status: :created }
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = @like.errors.full_messages
          redirect_to @image
        end
        format.json { render json: { errors: @like.errors.full_messages  }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = Like.find_by(user: current_user, image: @image)
    if @like.destroy
      respond_to do |format|
        format.html do
          flash[:success] = 'Like deleted!'
          redirect_to @image
        end
        format.json { render json: { likes_count: @image.likes.count }, status: :ok }
      end
    else
      respond_to do |format|
        format.html do
          flash[:error] = @like.errors.full_messages
          redirect_to @image
        end
        format.json { render json: { errors: @like.errors.full_messages  }, status: :not_found }
      end
    end
  end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end

end