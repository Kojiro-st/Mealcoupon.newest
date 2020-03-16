$(function() {
  alert('OK');
  $("#post-search-field").on("keyup", function() {
    let input = $("#post-search-field").val();
    console.log(input);
  });
});
