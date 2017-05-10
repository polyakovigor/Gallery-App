class SessionsController < Devise::SessionsController
  after_action :track_visit, only: [:destroy]

  def destroy
    super
  end

  protected

  def track_visit
    if request.delete?
      Event.create(user_id: current_user.try(:id), url: request.original_url, action: 'SignOut')
    end
  end

end