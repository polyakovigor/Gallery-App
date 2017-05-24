$( document ).ready(function() {
    $('#like_or_unlike').on("click", function(event) {
        event.preventDefault();
        if ($(this).find('span').hasClass('glyphicon-heart-empty')) {
            $(this).find('span').toggleClass('glyphicon-heart')
            $.ajax({
                url: '/images/' + $('#like_or_unlike').data('image_id') + '/likes',
                method: 'POST',
                dataType: 'json',
                success: function(data) {
                    console.log('SUCCESS');
                },
                error: function(data) {
                    console.log('ERROR');
                }
            });
        }
        else
            $.ajax({
                url: '/images/' + $('#like_or_unlike').data('image_id') + '/likes',
                method: 'DELETE',
                dataType: 'json',
                success: function(data) {
                    console.log('SUCCESS');
                },
                error: function(data) {
                    console.log('ERROR');
                }
            })
    });
});