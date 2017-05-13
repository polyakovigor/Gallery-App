class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :track_action

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :second_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :second_name ])
  end

  def track_action
    if request.get? && current_user.present?
      Event.create(user: current_user, url: request.original_url, action: 'Visit')
    end
  end
end
