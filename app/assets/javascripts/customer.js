$(document).on('turbolinks:load', function(){

  $('.request').on('click',function(e){
    e.preventDefault();
    $('.edit_page').fadeIn('slow');
  })


})