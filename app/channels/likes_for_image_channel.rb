class LikesForImageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "likes_for_image_#{ params['image_id'] }_channel"
  end

  def unsubscribed
  end

  def like(data)
    current_user.likes.create!(body: data['like'], image_id: data['image_id'])
  end

  def dislike(data)
    current_user.likes.destroy!(body: data['dislike'], image_id: data['image_id'])
  end
end