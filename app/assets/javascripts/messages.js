$(function(){
  $('.messages').scrollTop($('.messages')[0].scrollHeight)

  // メッセージ非同期通信機能
  function appendMessage(data){
    if(data.image && data.text){
      var html =`<div class="messages__self message_sales" data-message-id="${data.id}">
                  <p class="date">${data.date}</p>
                  <div class="messages__self__wrapper">
                    <p>${data.text}</p>
                    <img src="${data.image}">
                  </div>
                </div>`
      $('.messages').append(html);
    }else if(data.text){
      var html =`<div class="messages__self message_sales" data-message-id="${data.id}">
                  <p class="date">${data.date}</p>
                  <div class="messages__self__wrapper">
                    <p>${data.text}</p>
                  </div>
                </div>`
      $('.messages').append(html);
    }else if(data.image){
      var html =`<div class="messages__self message_sales" data-message-id="${data.id}">
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
    e.preventDefault();
    e.stopImmediatePropagation();
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
      alert("通信に失敗しました");
    });
    
  });

  // メッセージ自動更新機能 sales側

  function appendSales(data){

    if(data.image && data.text){
      var html =`<div class="messages__opponent message_sales" data-message-id="${data.id}">
                  <div class="messages__opponent--info">
                    <p class="name">${data.customer_name} 様</p>
                    <p class="date">${data.date}</p>
                  </div>
                  <div class="messages__opponent__wrapper">
                    <p>${date.text}</p>
                    <img src="${date.image}">
                  </div>
                </div>`
      $('.messages').append(html);
    }else if(data.text){
      var html =`<div class="messages__opponent message_sales" data-message-id="${data.id}">
                  <div class="messages__opponent--info">
                    <p class="name">${data.customer_name}</p>
                    <p class="date">${data.date}</p>
                  </div>
                  <div class="messages__opponent__wrapper">
                    <p>${date.text}</p>
                  </div>
                </div>`
      $('.messages').append(html);
    }else if(data.image){
      var html =`<div class="messages__opponent message_sales" data-message-id="${data.id}">
                  <div class="messages__opponent--info">
                    <p class="name">${data.customer_name}</p>
                    <p class="date">${data.date}</p>
                  </div>
                  <div class="messages__opponent__wrapper">
                    <img src="${date.image}">
                  </div>
                </div>`
      $('.messages').append(html);
    }
  }



  var autoUpdateMessagesSales = function(){
    var dataId = $('.message_sales:last').data('message-id');
    $.ajax({
      url: "messages/auto_update_sales",
      type: "GET",
      data: {message_id: dataId},
      dataType: 'json'
    })
    .done(function(messages){
      if(messages.array.length !== 0){
        $.each(messages.array,function(i,message){
          appendSales(message)
        });
      }
    })
    .fail(function(){
      alert('通信に失敗しました');
    });
  };

  // メッセージ自動更新機能 customer側

  function appendCustomer(data){
    if(data.image && data.text){
      var html =`<div class="messages__opponent message_customer" data-message-id="${data.id}">
                  <div class="messages__opponent--info">
                    <p class="name">${data.sales_name}</p>
                    <p class="date">${data.date}</p>
                  </div>
                  <div class="messages__opponent__wrapper">
                    <p>${data.text}</p>
                    <img src="${data.image}">
                  </div>
                </div>`
      $('.messages').append(html)      
    }else if(data.text){
      var html =`<div class="messages__opponent message_customer" data-message-id="${data.id}">
                  <div class="messages__opponent--info">
                    <p class="name">${data.sales_name}</p>
                    <p class="date">${data.date}</p>
                  </div>
                  <div class="messages__opponent__wrapper">
                    <p>${data.text}</p>
                  </div>
                </div>`
    $('.messages').append(html)
    }else if(data.image){
      var html =`<div class="messages__opponent message_customer" data-message-id="${data.id}">
                  <div class="messages__opponent--info">
                    <p class="name">${data.sales_name}</p>
                    <p class="date">${data.date}</p>
                  </div>
                  <div class="messages__opponent__wrapper">
                    <img src="${data.image}">
                  </div>
                </div>`
      $('.messages').append(html)
    }
  }

  var autoUpdateMessagesCustomer = function(){
    var dataId = $('.message_customer:last').data('message-id');
    $.ajax({
      url: "messages/auto_update_customer",
      type: "GET",
      data: {message_id: dataId},
      dataType: 'json'
    })
    .done(function(messages){
      $.each(messages.array,function(i,message){
        appendCustomer(message)
      });
    })
    .fail(function(){
      alert('通信に失敗しました');
    });
  }

  if(document.location.href.match(/\/events\/\d\/messages/)){
    setInterval(autoUpdateMessagesSales,7000);
    setInterval(autoUpdateMessagesCustomer,7000);
  }
  
});

