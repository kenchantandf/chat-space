$(document).on('turbolinks:load', function() {
  $('#user-search-field').on('keyup', AjaxSearch);
  $('.chat-group-form').on('click', '.add-group-user__btn', function() {
    var user = $(this).parent(),
        userId   = user.data('id');
        userName = user.data('name');
    AddUser(user, userId, userName);
  });
  $('.chat-group-form').on('click', '.chat-group-user__btn', function() {
    var user = $(this).parent();
    RemoveUser(user);
  });
});


function buildAddList(user) {
  var list = `<div class="add-group-user" data-id="${ user.id }" data-name="${ user.name }">
                <p class="add-group-user__name">${ user.name }</p>
                <a class="add-group-user__btn">追加</a>
              </div>`;
  return list;
}

function buildUserList(id, name) {
  var list = `<li class="chat-group-user">
              <input type='hidden' name="group[user_ids][]" value="${ id }" />
                <p class="chat-group-user__name">${ name }</p>
                <a class="chat-group-user__btn">削除</a>
              </li>`;
  return list;
}

function AjaxSearch() {
  var keyword = $(this).val();

  if (keyword.length != 0) {
    $.ajax({
      type: 'GET',
      url: '/users/search',
      data: { name: keyword },
      dataType: 'json',
    })
    .done(function(data) {
      $(".add-group-user").remove();
      $.each(data.users, function(i, user) {
        var list = buildAddList(user);
        $('#user-search-result').append(list);
      });
    })
    .fail(function() {
      alert('エラーが発生しました。');
    });
  }
}

function AddUser(user, userId, userName) {
  user.remove();
  var list = buildUserList(userId, userName);
  $('#group-users').append(list);
}

function RemoveUser(user){
  user.remove();
}
