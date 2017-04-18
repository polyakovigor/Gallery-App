class LikesForImageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "likes_for_image_#{ params['image_id'] }_channel"
  end

  def unsubscribed
  end

  def like(data)
    Like.create(image_id: data['image_id'], user_id: current_user.id)
  end

  def dislike(data)
    Like.where(image_id: data['image_id'], user_id: current_user.id).destroy_all
  end
end