class LikeBroadcastJob < ApplicationJob
  queue_as :default

  def perform(like)
    ActionCable.server.broadcast "likes_for_image_#{ like.image_id }_channel", like.image.likes.size
  end
end
