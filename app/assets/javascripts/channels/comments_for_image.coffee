App.comments = App.cable.subscriptions.create {
  channel: "CommentsForImageChannel"
  image_id: ''
},
  connected: ->
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
# Data received

  send_message: (comment, image_id) ->
    @perform 'send_message', comment: comment, image_id: image_id