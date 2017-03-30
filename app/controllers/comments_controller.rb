class CommentsController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.create(comments_params)
    @comment.user_id = current_user.id if current_user
    @comment.save
    if @comment.save(comments_params)
      redirect_to image_path(@image)
    else
      flash[:error] = @comment.errors.full_messages
    end
  end

  def destroy
    @image = Image.find(params[:image_id])
    @comment = @image.comments.find(params[:id])
    @comment.destroy
    flash[:success] = 'Comment deleted.'
    redirect_to image_path(@image)
  end

  private

  def comments_params
    params.require(:comment).permit(:user_id, :body, :image_id)
  end
end
