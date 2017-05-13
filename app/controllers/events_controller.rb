class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]
  skip_after_action :track_action

  def index
    @users = User.order('email ASC').page(params[:page])
  end

  def navigation
  end

  def user_sign_in
  end

  def user_sign_out
  end

  def user_likes
  end

  def user_comments
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
