class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]

  def index
    @users = User.all
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
    @user = User.find(params[:id])
  end
end
