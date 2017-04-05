class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comments_params.merge(image_id: @image.id))
    respond_to do |format|
      if @comment.save
        flash[:success] = 'Comment posted.'
        format.html { render nothing: true }
        format.json
      else
        flash[:error] = @comment.errors.full_messages
        format.html { render nothing: true }
        format.json
      end
    end
  end

  def destroy
    @comment = @image.comments.find(params[:id])
      if @comment.destroy
        respond_to do |format|
          flash[:success] = 'Comment deleted.'
          format.html { redirect_to image_path(@image) }
          format.json
      end
    end
  end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end

end
