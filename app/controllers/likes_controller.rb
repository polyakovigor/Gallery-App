class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image

  def create
    @like = current_user.likes.build(likes_params)
    if @like.save
      respond_to do |format|
        format.html do
          flash[:notice] = 'Like created!'
          redirect_to @image
        end
        format.json { render json: { message: 'Like created!'}, status: :created }
      end
    else
      respond_to do |format|
        format.html do
          flash[:danger] = @like.errors.full_messages
          redirect_to @image
        end
        format.json { render json: { errors: @like.errors.full_messages  }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      respond_to do |format|
        format.html do
          flash[:success] = 'Like deleted!'
          redirect_to @image
        end
        format.json { render json: { message: 'Like deleted!' }, status: :no_content }
      end
    else
      format.html do
        flash[:danger] = @like.errors.full_messages
        redirect_to @image
      end
      format.json { render json: { errors: @like.errors.full_messages  }, status: :not_found }
    end
  end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end

  def likes_params
    params.require(:like).permit(:image_id)
  end
end
