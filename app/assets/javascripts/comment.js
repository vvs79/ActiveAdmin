$(function() {
  $('#new_all_comment').on('ajax:success', function(a) {
    $(this).find('input[type="text"]').val('');
    $(this).find('textarea').val('');
  });
});
