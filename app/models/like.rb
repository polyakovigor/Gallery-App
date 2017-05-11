class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image

  default_scope { order('created_at asc') }

  validates :image_id, uniqueness: { scope: :user_id }

end