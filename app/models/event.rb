class Event < ApplicationRecord
  belongs_to :user

  default_scope { order('created_at desc') }

  scope :visits, -> (user) { where(user_id: user, action: 'Visit') }
  scope :sign_in, -> (user) { where(user_id: user, action: 'SignIn').order(created_at: :desc).first }
  # scope :sign_out, -> (user) { where(user: user, action: 'SignOut').order(created_at: :desc).first }

  validates :user, presence: true
  validates :action, inclusion: { in: %w(Visit SignIn SignOut) }
  validates :url, presence: true, if: Proc.new{ |event| event.action == 'Visit' }
end