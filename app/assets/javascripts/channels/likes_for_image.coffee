$ ->
  likes = $('#likes')

  App.likes = App.cable.subscriptions.create {
    channel: "LikesForImageChannel"
    image_id: likes.data('image-id')
  },
    connected: ->
  # Called when the subscription is ready for use on the server

    disconnected: ->
  # Called when the subscription has been terminated by the server

    received: (data) ->
  # Data received

    like: (image_id, user_id) ->
      @perform 'like', image_id: image_id, user_id: user_id

    dislike: (image_id, user_id) ->
      @perform 'dislike', image_id: image_id, user_id: user_id

    $('#like').click (e) ->
      e.preventDefault()
      