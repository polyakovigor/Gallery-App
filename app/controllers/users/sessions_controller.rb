class Users::SessionsController < Devise::SessionsController

  def create
    super
    Event.create(user_id: current_user.try(:id), action: 'SignIn')
  end

  def destroy
    Event.create(user_id: current_user.try(:id), action: 'SignOut')
    super
  end

end