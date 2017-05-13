class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image

  default_scope { order(:created_at) }

  validates :image, uniqueness: { scope: :user }
  validates :image, :user, presence: true

end