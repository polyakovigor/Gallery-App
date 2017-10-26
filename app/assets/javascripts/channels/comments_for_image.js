$(function() {
    var comments_to_bottom;
    var comments = $('#comments')
    if (comments.length > 0) {
        comments_to_bottom = function() {
            return comments.scrollTop(comments.prop("scrollHeight"));
        };
        comments_to_bottom();
        App.comment = App.cable.subscriptions.create({
            channel: "CommentsForImageChannel",
            image_id: comments.data('image-id')
        }, {
            connected: function() {},
            disconnected: function() {},
            received: function(data) {
                comments.append(data['comment']);
                return comments_to_bottom();
            },
            add_comment: function(comment, image_id) {
                return this.perform('add_comment', {
                    comment: comment,
                    image_id: image_id
                });
            }
        });
        return $('#new_comment').submit(function(e) {
            var textarea;
            e.preventDefault();
            textarea = $(this).find('#comment_body');
            if (textarea.val().trim().length > 1) {
                App.comment.add_comment(textarea.val(), comments.data('image-id'));
                textarea.val('');
            }
            return false;
        });
    }
});