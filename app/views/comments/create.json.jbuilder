json.id @comment.id
json.body @comment.body
json.user_id @comment.user_id
json.user_first_name @comment.user.first_name
json.time_ago time_ago_in_words(@comment.created_at)
json.image_id @comment.image_id
json.isCurrentUser @comment.user == current_user