$( document ).ready(function() {
    $('#like_or_unlike').click(function (e) {
        e.preventDefault();
        var span = $(this).find('span');
        var image_id = $(this).data('image-id');
        if (span.hasClass('glyphicon-heart-empty')){
            $.ajax({
                dataType: 'JSON',
                method: 'POST',
                url: '/images/' + image_id + '/likes',
                success: function (data) {
                    $('.likes_count').text(data.likes_count);
                    span.removeClass('glyphicon-heart-empty');
                    span.addClass('glyphicon-heart');
                },
                error: function (data) {
                    console.log(data);
                }
            });
        }else{
            $.ajax({
                dataType: 'JSON',
                method: 'DELETE',
                url: '/images/' + image_id + '/likes',
                success: function (data) {
                    $('.likes_count').text(data.likes_count);
                    span.removeClass('glyphicon-heart');
                    span.addClass('glyphicon-heart-empty');
                },
                error: function (data) {
                    console.log(data);
                }
            });
        }
        $(this).blur();
    });
});