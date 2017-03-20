var formData = new FormData();
$( document ).ready(function() {
    $('#image_picture').on("change", function(event) {
        var input = event.target;

        $.each(input.files, function(index, file){
            var reader = new FileReader();
            var fileName = '';
            reader.onload = function(){
                var dataURL = reader.result;
                var outputTemplate = $('.template.output');
                var divOutput = $(outputTemplate).clone().removeClass('template');
                divOutput.find('img')[0].src = dataURL;
                fileName = file.name;
                divOutput.find('.image_title')[0].value = fileName;
                $(divOutput).insertAfter('.template.output');
                formData.append('category[images_attributes][' + index + '][picture]', file);
            };
            reader.readAsDataURL(file);
        });
    });

    $('.btn.btn-large.btn-success').on("click", function(event) {
        $.each($('.output:not(.template)').find('.image_title'), function(index, inputItem){
            console.log($(inputItem).val());
            formData.append('category[images_attributes][' + index + '][title]', $(inputItem).val());
        });
        $.ajax({
            url: '/categories/' + $('#category').val() + '/images',
            method: 'post',
            // dataType: 'json',
            processData: false,
            contentType: false,
            data: formData,
            success: function(data) {
                console.log('KPACABA');
            },
            error: function(data) {
                console.log('Ебать ты ЛОХ!!!');
            },
        })
    });
});
