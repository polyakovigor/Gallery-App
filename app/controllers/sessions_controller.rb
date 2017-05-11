class SessionsController < Devise::SessionsController
  after_action :track_action

  def destroy
    super
  end

  protected

  def track_action
    Event.create(user_id: current_user.try(:id), url: request.original_url, action: 'SignOut')
  end

end