function buildHTML(message) {
  var image = (message.image) ? '<img src="${ message.image }"/>' : '';
  var html = `<li class="chat-message">
                <div class="chat-message__header">
                  <p class="chat-message__user">${ message.name }</p>
                  <p class="chat-message__time">${ message.time }</p>
                </div>
                <p class="chat-message__body">${ message.text }</p>
                ${ image }
              </li>`;
  return html;
}

  $('#new-message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.chat-footer__body__textarea'),
          message = textField.val(),
          formData = new FormData($(this).get(0));
    $.ajax({
      type: 'POST',
      url: './messages',
      context: this,
      data: formData,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-messages').append(html);
      $(this).get(0).reset();
    })
    .fail(function() {
      alert('メッセージを入力してください。');
    });
    return false;
  });
