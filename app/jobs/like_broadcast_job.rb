class LikeBroadcastJob < ApplicationJob
  queue_as :default

  def perform(like)
    ActionCable.server.broadcast "likes_for_image_#{ like.image_id }_channel",
                                 like: like(like)
  end

  private

  def like(like)
    CommentsController.render '#', locals: { like: like }
  end

end
