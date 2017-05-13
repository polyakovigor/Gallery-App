class Event < ApplicationRecord
  belongs_to :user

  default_scope { order('created_at desc') }

  validates :user_id, presence: true
  validates :action, inclusion: { in: %w(Visit SignIn SignOut) }
  validates :url, presence: true, if: Proc.new{ |event| event.action == 'Visit' }
end