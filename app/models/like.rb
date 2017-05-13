class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image

  default_scope { order('created_at') }

  validates :image, uniqueness: { scope: :user }
  validates :user, presence: true
  validates :image, presence: true

end