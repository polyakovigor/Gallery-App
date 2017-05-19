class Comment < ApplicationRecord

  paginates_per 15

  default_scope { order('created_at desc') }

  belongs_to :user
  belongs_to :image

  validates :body, presence: true, length: { maximum: 140 }
  validates :user, :image, presence: true

  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
