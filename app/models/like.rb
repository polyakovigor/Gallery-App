class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates :image_id, uniqueness: { scope: :user_id }

  after_create_commit { LikeBroadcastJob.perform_later(self) }

  # after_destroy_commit { LikeBroadcastJob.perform_later(self.image) }
end