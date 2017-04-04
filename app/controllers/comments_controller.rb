class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comments_params.merge(image_id: @image.id))
    if @comment.save
      flash[:success] = 'Comment posted.'
    else
      flash[:error] = @comment.errors.full_messages
    end
    redirect_to image_path(@image)
  end

  def destroy
    @comment = @image.comments.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      flash[:success] = 'Comment deleted.'
    else
      flash[:error] = 'Something went wrong. Reload page.'
    end
    redirect_to image_path(@image)
  end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end

end
