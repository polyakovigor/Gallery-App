$(function() {
    var messages_to_bottom;
    var messages = $('#messages');
    if (messages.length > 0) {
        messages_to_bottom = function() {
            return messages.scrollTop(messages.prop("scrollHeight"));
        };
        messages_to_bottom();
        App.global_chat = App.cable.subscriptions.create({
            channel: "ChatRoomsChannel",
            chat_room_id: messages.data('chat-room-id')
        }, {
            connected: function() {},
            disconnected: function() {},
            received: function(data) {
                messages.append(data['message']);
                return messages_to_bottom();
            },
            send_message: function(message, chat_room_id) {
                return this.perform('send_message', {
                    message: message,
                    chat_room_id: chat_room_id
                });
            }
        });
        return $('#new_message').submit(function(e) {
            var textarea;
            e.preventDefault();
            textarea = $(this).find('#message_body');
            if (textarea.val().trim().length > 1) {
                App.global_chat.send_message(textarea.val(), messages.data('chat-room-id'));
                textarea.val('');
            }
            return false;
        });
    }
});