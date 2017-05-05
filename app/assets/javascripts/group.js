$(document).on('turbolinks:load', function() {
  $('#user-search-field').on('keyup', function() {
    AjaxSearch();
  });
  $('.chat-group-form').on('click', '.add-group-user__btn', function() {
    var user = $(this).parent();
    var user_id   = user.data('id');
    var user_name = user.data('name');
    AddUser(user, user_id, user_name);
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
  var keyword = $('#user-search-field').val();
  $.ajax({
    type: 'GET',
    url: '/users/search',
    data: { name: keyword },
    dataType: 'json'
  })
  .done(function(data) {
    $('.add-group-user').remove();
    if (keyword.length !== 0) {
      $.each(data.users, function(i, user) {
        var list = buildAddList(user);
        $('#user-search-result').append(list);
      });
    }
  })
  .fail(function() {
    alert('変更が保存されませんでした。');
  });
  return false;
}

function AddUser(user, user_id, user_name) {
  user.remove();
  var list = buildUserList(user_id, user_name);
  $('#group-users').append(list);
}

function RemoveUser(user){
  user.remove();
}
