$( document ).ready(function() {

    function bindDeleteComment(element) {
        var link = $(element);
        if (confirm('Are you sure?')) {
            $.ajax({
                method: 'POST',
                url: link.attr('href'),
                data: {_method: 'DELETE'},
                dataType: 'JSON',
                success: function () {
                    console.log(link);
                    console.log(link.parents('li'));
                    link.parents('li').remove();
                }
            });
        }
        return false;
    }
    $('a.delete').click(function () {
        bindDeleteComment($(this));
        return false
    });

    $('button.btn.button').on('click', function () {
        $.ajax({
            method: 'POST',
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

                var delete_link = $(output_li).find('a.delete');
                delete_link.attr('href', '/images/' + result['image_id'] + '/comments/' + result['id']);
                $(delete_link).click(function () {
                    bindDeleteComment($(this));
                    return false;
                });

                $('ol.comments').append(output_li);

                $('#new_comment textarea').val('');
            }
        });
    });
});