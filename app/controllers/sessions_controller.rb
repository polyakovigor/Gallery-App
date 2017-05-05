class SessionsController < Devise::SessionsController
  after_action :create_event, only: [:destroy]

  def destroy
    super
  end

  protected

  def create_event
    #here is my code
  end

end