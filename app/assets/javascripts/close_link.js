$(function(){
  $('.close_link').on('click', function() {
    var parent = $(this).parent();
    $(this).siblings('.for_empty').empty();
    parent.slideUp(350);
    return false;
  });
});
