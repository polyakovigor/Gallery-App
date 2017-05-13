class Event < ApplicationRecord
  belongs_to :user

  default_scope { order('created_at desc') }
  # scope :visits, -> { where(action: 'Visit') }
  # scope :signout, -> { where(action: 'SignOut')}
  # scope :signin, -> { where(action: 'SignIn')}

  validates :user, presence: true
  validates :action, inclusion: { in: %w(Visit SignIn SignOut) }
  validates :url, presence: true, if: Proc.new{ |event| event.action == 'Visit' }
end