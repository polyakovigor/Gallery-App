class Users::SessionsController < Devise::SessionsController

  def create
    super
    create_event('SignIn')
  end

  def destroy
    create_event('SignOut')
    super
  end

  private

    def create_event(action)
      Event.create(user_id: current_user.try(:id), action: action)
    end

end