class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]
  skip_after_action :track_action

  def index
    @users = User.order('email ASC').page(params[:page])
  end

  def navigation
    @user.events = Event.where(action: 'Visit')
  end

  def user_sign_in
    @event = Event.where(user: @user, action: 'SignIn').order('created_at').first
  end

  def user_sign_out
    @event = Event.where(user: @user, action: 'SignOut').order('created_at DESC').first
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
