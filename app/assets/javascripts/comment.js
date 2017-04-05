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
                // var dataURL = result;
                var resultTemplate = $('.template.result');
                var divOutput = $(resultTemplate).clone().removeClass('template');
                divOutput.find('li')[0] = dataURL;
                $(divOutput).insertAfter('.template.result');
            },
        });
    });
});