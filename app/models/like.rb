class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image

  after_create_commit { LikeBroadcastJob.perform_later(self) }
  after_destroy_commit {  LikeBroadcastJob.perform_later(self) }
end
