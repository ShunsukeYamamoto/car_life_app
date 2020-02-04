$(function(){

  $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight});

  function appendMessage(data){
    if(data.image && data.text){
      var html =`<div class="messages__self">
                  <p class="date">${data.date}</p>
                  <div class="messages__self__wrapper">
                    <p>${data.text}</p>
                    <img src="${data.image}">
                  </div>
                </div>`
      $('.messages').append(html);
    }else if(data.text){
      var html =`<div class="messages__self">
                  <p class="date">${data.date}</p>
                  <div class="messages__self__wrapper">
                    <p>${data.text}</p>
                  </div>
                </div>`
      $('.messages').append(html);
    }else if(data.image){
      var html =`<div class="messages__self">
                  <p class="date">${data.date}</p>
                  <div class="messages__self__wrapper">
                    <p></p>
                    <img src="${data.image}">
                  </div>
                </div>`
      $('.messages').append(html);
    }
      
    
  }

  $('#new_message').on('submit',function(e){
    debugger
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      appendMessage(data);
      $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight});
      $('#new_message')[0].reset();
      $('.submit_btn').removeAttr('disabled');
    })
    .fail(function(data){
      alert("おかしい");
    });
    
  });
});