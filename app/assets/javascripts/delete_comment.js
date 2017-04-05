$( document ).ready(function() {
    var bindDeleteComment;

    bindDeleteComment = function(e) {
        var link, url;
        e.preventDefault();
        url = $(this).attr('href');
        link = $(this);
        if (confirm('Are you sure?')) {
            return $.ajax({
                method: "POST",
                url: url,
                data: {
                    _method: 'DELETE'
                },
                dataType: 'JSON',
                success: function() {
                    return link.parents('li.list-unstyled.user-comment').remove();
                },
                error: function(data) {
                    return alertMessage(data, form);
                }
            });
        }
    };
});