class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def navigation

  end

  def user_sign_in
    @user = User.find(params[:id])
    @user.last_sign_in_at
  end

  def user_sign_out

  end

  def likes

  end

  def comments

  end
end
