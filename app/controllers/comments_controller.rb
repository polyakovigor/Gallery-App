class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.page(params[:page])
  end
end
