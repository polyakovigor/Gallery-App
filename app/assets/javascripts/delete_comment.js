$( document ).ready(function() {
    $('a.delete').click(function (e) {
        e.preventDefault()
        if (confirm('Are you sure?')) {
            $.ajax({
                method: 'POST',
                url: $(this).attr('href'),
                data: { _method: 'DELETE' },
                dataType: 'JSON',
                success: function () {
                    $(this).parents('li').remove();
                },
            });
        }
    });
});


