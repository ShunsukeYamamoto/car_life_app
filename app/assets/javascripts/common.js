$(function(){
  
  setTimeout("$('.alert').fadeOut()",1000);
  setTimeout("$('.notice').fadeOut()",1000);

  $('.form_menu').fadeIn('slow');

  $('.car_field--name').on('click',function(){
    $('.car_field--name').each(function(index,element){
      $(this).css('box-shadow','none')
    })
    $(this).css('box-shadow','0 0 5px 5px orange inset');
  })

})
