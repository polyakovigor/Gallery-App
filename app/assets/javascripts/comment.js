$( document ).ready(function() {
    $("button.btn.button").on("click", function (event) {
        // event.preventDefault();
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
                // var resultTemplate = $('.template.result');
                // var divOutput = $(resultTemplate).clone().removeClass('template');
                //
                // $(divOutput).insertAfter('.template.result');
            },
        });
    });
});