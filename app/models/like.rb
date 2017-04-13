class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image, counter_cache: true

  after_create_commit { LikeBroadcastJob.perform_later(self) }
  after_destroy {  LikeBroadcastJob.perform_later(self) }
end
