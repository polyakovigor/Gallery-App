class CommentsForImageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments_for_image_#{params['image_id']}_channel"
  end

  def unsubscribed; end

  def add_comment(data)
    current_user.comments.create!(body: data['comment'], image_id: data['image_id'])
  end
end
