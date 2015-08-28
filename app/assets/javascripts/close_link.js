$(function(){
  $('.close_link').on('click', function() {
    var parent = $(this).parent();
    $(this).siblings('.top_list').empty();
    parent.slideUp(350);
    return false;
  });
});
