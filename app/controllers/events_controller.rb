class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]
  skip_after_action :track_visit

  def index
    @users = User.page(params[:page])
  end

  def navigation
  end

  def user_sign_in
  end

  def user_sign_out
  end

  def user_likes
    @likes = @user.likes
  end

  def user_comments
    @comments = @user.comments
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end
