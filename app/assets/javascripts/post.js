$(function(){
  $('.content').css("opacity","0");
  $(window).scroll(function (){
    $(".content").each(function(){
      var imgPos = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > imgPos - windowHeight + windowHeight/5){
        $("content",this).css("opacity","1" );
        $("content",this).css({
          "width": "90%",
          "margin": "0 auto",
          "background-color": "white",
          "border-radius": "5px"
        });
      } else {
        $("content",this).css("opacity","0" );
        $("content",this).css({
          "width": "90%",
          "margin": "0 auto",
          "background-color": "white",
          "border-radius": "5px"
        });
      }
    });
  });
});
  