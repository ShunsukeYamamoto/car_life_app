$(function(){

  function appendCustomer(customer){
    var customerIndex = `<p class="customer_index--name" data-user-id="${customer.id}" data-user-name="${customer.name}">
                          ${customer.name} 様
                        </p>`
    $('.customer_index').append(customerIndex);
  }

  function appendEmpty(){
    var html =`<p class="customer_index--name">
                該当ユーザーがいません
              </p>`
    $('.customer_index').empty();
    $('.customer_index').append(html);
  }


  $('.text').on('keyup',function(e){
    e.preventDefault();
    var input = $(this).val();
    $.ajax({
      url: '/',
      type: 'GET',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(customers){
      $('.customer_index').empty();
      if(customers.length != 0){
        customers.forEach(function(customer){
          appendCustomer(customer)
        })
      }else{
        appendEmpty();
      }
    })
  })
})

$(document).on('click','.customer_index--name',function(){
  var name = $(this).attr('data-user-name')
  $('.text').val(name);
  $('.customer_index').empty();
})