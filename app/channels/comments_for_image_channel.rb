class CommentsForImageChannel < ApplicationCable::Channel

  def follow(params)
    stop_all_streams
    stream_from "comments_for_image_#{ params['image_id'] }_channel"
  end

  def unfollow
    stop_all_streams
  end

  def new_comment(data)
    current_user.comments.create!(body: data['new_comment'], image_id: data['image_id'])
  end
end