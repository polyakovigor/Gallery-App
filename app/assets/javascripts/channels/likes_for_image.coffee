App.comments = App.cable.subscriptions.create {
  channel: "LikesForImageChannel"
  image_id: ''
},
  connected: ->
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
# Data received

  like: (like, image_id) ->
    @perform 'like', like: like, image_id: image_id