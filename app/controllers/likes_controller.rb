class LikesController < ApplicationController
  before_action :authenticate_user!

  def create

  end

  def destroy

  end

  def like
    get_like
    @like.value += 1 unless @like.value == 1
    @like.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def dislike
    get_like
    @like.value -= 1 unless @like.value == -1
    @like.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def get_like
    current_image = @image.detect{|r| r.id == params[:id].to_i}
    @like = current_image.likes.find_by_user_id(current_user.id)
    unless @like
      @like = Like.create(:user_id => current_user.id, :value => 0)
      current_image.likes << @like
    end
  end
end
