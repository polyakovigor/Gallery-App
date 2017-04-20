$ ->
  likes = $('#like')

  App.likes = App.cable.subscriptions.create {
      channel: "LikesForImageChannel"
      image_id: likes.data('image-id')
    },
    connected: ->

    disconnected: ->

    received: (data) ->
      updateLikeCount data.like_count

    like: (image_id) ->
      @perform 'like', image_id: image_id

    unlike: (image_id, user_id) ->
      @perform 'unlike', image_id: image_id, user_id: user_id

    $('#like').click (e) ->
      e.preventDefault()
      if $(this).find('span').hasClass('glyphicon-heart-empty')
        $(this).find('span').toggleClass('glyphicon-heart')
        App.likes.like likes.data('image-id')
      else
      App.likes.unlike likes.data('image-id')

  updateLikeCount = (count) =>
    likes.find('.likes_count').html(count)