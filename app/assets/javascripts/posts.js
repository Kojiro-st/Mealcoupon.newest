$(function() {
  function addUser(post) {
    let html = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">${user.name}</p>
        <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
      </div>
    `;
    $("#user-search-result").append(html);
  }

  function addNoUser() {
    let html = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">ユーザーが見つかりません</p>
      </div>
    `;
    $("#user-search-result").append(html);
  }


  $("#post-search-field").on("keyup", function() {
    let input = $("#post-search-field").val();
    $.ajax({
      type: "GET",
      url: "/psots",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function(posts) {
        console.log("成功です");
      })
      .fail(function() {
        console.log("失敗です");
      });
  });
});
