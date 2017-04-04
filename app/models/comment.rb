class Comment < ApplicationRecord

  default_scope { order('created_at asc') }

  belongs_to :user
  belongs_to :image

  validates :body, presence: true, length: { maximum: 140 }
end
