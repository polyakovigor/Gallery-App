class CommentsController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.create(comments_params)
    redirect_to image_path(@image)
  end

  def destroy

  end

  private

  def comments_params
    params.require(:comments).permit(:body)
  end
end
