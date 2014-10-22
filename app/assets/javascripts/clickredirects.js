$(document).ready(function(){
  $('#avatar').click(function(){
    window.location.href = "/";
  });

  $('notifydropdown').click(function() {
    $(this).html('<i class="fa fa-caret-down"></i><i class="fa fa-bell fa-fw"></i>');
  });
})
