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

    $('.btn-default.btn-lg').on("click", function(event) {
        var emptyInputs = $('.output:not(.template)').find('.image_title').filter(function() { return $(this).val() == ""; });
        if (emptyInputs.length > 0) {
            $.each(emptyInputs, function(index, input) {
                $(input).addClass('error');
                setTimeout(function(){
                    $(input).removeClass('error');},
                    2000);
                });
        } else {
            $.each($('.output:not(.template)').find('.image_title'), function(index, inputItem){
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
                    console.log('SUCCESS');
                },
                error: function(data) {
                    alert("Please choose a file!");
                    console.log('ERROR');
                },
            });
        }
    });
});
