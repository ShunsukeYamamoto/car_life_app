$(document).on('turbolinks:load', function() { 

  $('.car_add').on('click',function(e){
    e.preventDefault();
    $('.edit_page').fadeIn();
  })

  $('.close_icon').on('cloick',function(e){
    e.preventDefault();
    $('.edit_page').fadeOut();
  })

  $fileField = $('.file_upload')

  $($fileField).on('change',$fileField,function(e){
    file = e.target.files[0];
    reader = new FileReader();
    $preview = $('.image_display');

    reader.onload = (function(file){
      return function(e){
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  })
});