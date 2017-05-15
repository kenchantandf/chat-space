$(document).on('turbolinks:load', function() {
  $('#new-message').on('submit', function(e) {
    e.preventDefault();

    sendMessageAjax = sendMessageAjax.bind(this);

    sendMessageAjax();
  });
  reloadPage();
});

function buildHTML(message) {
  var image = message.image ? `<img src = ${message.image}>` : '';

  return `
    <li class="chat-message">
      <div class="chat-message__header">
        <p class="chat-message__user">${ message.name }</p>
        <p class="chat-message__time">${ message.time }</p>
      </div>
      <p class="chat-message__body">${ message.text }</p>
      ${ image }
    </li>
  `;
}

function scrollToBottom() {
  $('.chat-context').animate({
    scrollTop: $('.chat-messages').height()
  });
}

function sendMessageAjax() {
  var url = $(this).attr('action'),
      formData = new FormData(this);

  $.ajax({
    type: 'POST',
    url: url,
    data: formData,
    processData: false,
    contentType: false,
    dataType: 'json',
    context: this,
  })
  .done(function(data) {
    var html = buildHTML(data);
    $('.chat-messages').append(html);
    this.reset();

    scrollToBottom();
  })
  .fail(function() {
    alert('メッセージを入力してください。');
  });
}

function reloadPage() {
  setInterval(function() {
    $.ajax({
      type: 'GET',
      url: './messages',
      dataType: 'json',
    })
    .done(function(data) {
      var currentMessagesNum = $('.chat-message').length,
          newMessgaesNum = data.messages.length,
          newMessages = data.messages.slice(currentMessagesNum, newMessgaesNum),
          newMessagesHTML = '';

      $.each(newMessages, function(i, message) {
        $('.chat-messages').append(buildHTML(message));
      });

      scrollToBottom();
    })
    .fail(function() {
      alert('エラーが発生しました。');
    });
  }, 5000);
}
