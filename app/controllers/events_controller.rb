class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def navigation
  end

  def user_sign_in
    # @user = User.find(params[:id])
  end

  def user_sign_out
  end

  def user_likes
  end

  def user_comments
  end

end
