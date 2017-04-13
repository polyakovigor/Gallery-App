$ ->
  if $('#comments').length > 0
    comments = $('#comments')

    comments_to_bottom = -> comments.scrollTop(comments.prop("scrollHeight"))

    comments_to_bottom()

    App.comment = App.cable.subscriptions.create {
      channel: "CommentsForImageChannel"
      image_id: comments.data('image-id')
    },
      connected: ->
# Called when the subscription is ready for use on the server

      disconnected: ->
# Called when the subscription has been terminated by the server

      received: (data) ->
        comments.append data['comment']
        comments_to_bottom()

      add_comment: (comment, image_id) ->
        @perform 'add_comment', comment: comment, image_id: image_id


    $('#new_comment').submit (e) ->
      e.preventDefault()
      textarea = $(this).find('#comment_body')
      if textarea.val().trim().length > 1
        App.comment.add_comment textarea.val(), comments.data('image-id')
        textarea.val('')
      return false