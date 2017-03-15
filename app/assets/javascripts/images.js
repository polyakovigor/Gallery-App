var formData = new FormData();
$( document ).ready(function() {
    $('#image_picture').on("change", function(event) {
        var input = event.target;

        $.each(input.files, function(index, file){
            var reader = new FileReader();
            reader.onload = function(){
                var dataURL = reader.result;
                var outputTemplate = $('.template.output');
                var output = $(outputTemplate).clone().removeClass('template')[0];
                output.src = dataURL;
                $(output).insertAfter('.template.output');
            };
            reader.readAsDataURL(file);
            formData.append('category[images_attributes][' + index + '][picture]', file);
        });
    });

    $('.btn.btn-large.btn-success').on("click", function(event) {
        $.ajax({
            url: '/categories/' + $('#category').val() + '/images',
            method: 'post',
            // dataType: 'json',
            processData: false,
            contentType: false,
            data: formData,
            success: function(data) {
                console.log('сукес блеать');
            },
            error: function(data) {
                console.log('error');
            },


        })
    });
});
//на предзагрузке выводить title каждой картинки