$( document ).ready(function() {
    $("button.btn.button").on("click", function (event) {
        $.ajax({
            method: "POST",
            dataType: 'json',
            url: $('#new_comment').attr('action'),
            data: $('#new_comment').serialize(),
            success: function (result) {
                console.log(result['id']);
                console.log(result['user_id']);
                console.log(result['image_id']);
                console.log(result['body']);
                console.log(result['user_first_name']);
                console.log(result['time_ago']);

                var resultTemplate = $('.template.result');
                var output_li = $(resultTemplate).clone().removeClass('template');
                $(output_li).find('.content a.user').html(result['user_first_name']);
                $(output_li).find('.content .body').html(result['body']);
                $(output_li).find('span.timestamp').text('Commented '+ result['time_ago'] + ' ago.');
                $(output_li).find('a.destroy').attr('href', '/images/' + result['image_id'] + '/comments/' + result['id']);
                $('ol.comments').append(output_li);

                $('#new_comment textarea').val('');
            },
        });
    });
});