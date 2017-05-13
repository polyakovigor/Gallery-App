class Users::SessionsController < Devise::SessionsController

  def create
    Event.create(user_id: current_user.try(:id), action: 'SignIn')
    super
  end

  def destroy
    Event.create(user_id: current_user.try(:id), action: 'SignOut')
    super
  end

end