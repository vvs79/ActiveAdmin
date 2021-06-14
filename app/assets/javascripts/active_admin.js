//= require active_admin/base

$(function() {
  var msg = 'Create comment', input = $('#all_comment_submit_action').find('input');
  input.val(msg);
  input.attr('data-disable-with',msg);
});
