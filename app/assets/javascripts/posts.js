$(function() {
  function addUser(post) {
    let html = `
      <div class="shopname-form__search-left clearfix">
        <p class="shopname-form__search-left__name">${post.shopname}</p>
      </div>
    `;
    $("#post-search-result").append(html);
  }

  function addNoUser() {
    let html = `
      <div class="shopname-form__search-left clearfix">
        <p class="shopname-form__search-left__name"店名が見つかりません</p>
      </div>
    `;
    $("#post-search-result").append(html);
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
      $("#post-search-result").empty();

      if (posts.length !== 0) {
        posts.forEach(function(post) {
          addUser(post);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        addNoPost();
      }
    })
    // .fail(function() {
    //   alert("通信エラーです。店名を表示できません。");
    });
  });
// });
