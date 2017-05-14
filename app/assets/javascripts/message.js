$(document).on('turbolinks:load', function() {
  $('#new-message').on("submit", function(e) {
    e.preventDefault();
    AjaxSend();
    return false;
  });
  pageReload();
});

function buildHTML(message) {
  var image = (message.image) ? `<img src = ${ message.image }>` : '';
  var html = `<li class="chat-message">
                <div class="chat-message__header">
                  <p class="chat-message__user">${ message.name }</p>
                  <p class="chat-message__time">${ message.time }</p>
                </div>
                <p class="chat-message__body">${ message.text }</p>
                <p>${ image }</p>
              </li>`;
  return html;
}

function scrollBottom() {
  $('.chat-context').animate({
    scrollTop: $('.chat-messages').height()
  });
}

function AjaxSend(){
    $.ajax({
      type: 'POST',
      url: './messages',
      data: new FormData($("#new-message").get(0)),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
          insertHTML = $("#new-message").get(0);
      $('.chat-messages').append(html);
      insertHTML.reset();
      scrollBottom();
    })
    .fail(function() {
      alert('メッセージを入力してください。');
    });
  }

function pageReload(){
  setInterval(function() {
    $.ajax({
      type: 'GET',
      url: './messages',
      dataType: 'json'
    })
    .done(function (data){
      var reloadMessage = $('.chat-message').length;
          newMessage = data.messages.length;
          buildMessage ='';
        for(var i = reloadMessage; i < newMessage; i++){
           buildMessage += buildHTML(data.messages[i]);
        };
     $('.chat-messages').append(buildMessage);
      scrollBottom();
    })
    .fail(function(){
      alert("エラーが発生しました。");
    })
  }, 5000);
}
