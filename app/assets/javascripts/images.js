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
                for (var i = 0; i < input.files.length; i++) {
                    console.log(input.files[i].name);
                }
                // var title = $('')
            };
            reader.readAsDataURL(file);
            formData.append('category[images_attributes][' + index + '][picture]', file);
            formData.append('category[images_attributes][' + index + '][title]', file);
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
                console.log('KPACABA');
            },
            error: function(data) {
                console.log('Ебать ты ЛОХ!!!');
            },
        })
    });
});
//-разбить на части filePath и вывести часть до точки
//на предзагрузке выводить title каждой картинки + возможность изменять его!!!!!!!!!!!!
// var name = $("#image_picture").val();
// var formData = new FormData(this);
// formData.append("NewFileName", name);
// console.log(formData);