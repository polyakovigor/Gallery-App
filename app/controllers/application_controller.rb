class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  # def after_sign_out_path_for(resource)
  #   resource == :user ? (redirect_to new_user_registration_path) : super
  # end

end
