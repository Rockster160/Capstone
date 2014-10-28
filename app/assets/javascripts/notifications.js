$(document).ready(function() {
  $('#notifydropdown').click(function() {
    setTimeout(function() {
      if ( $('.open').length ) {
        $('#notifydropdown').html('<i class="fa fa-caret-down white-link"></i><i class="fa fa-bell fa-fw white-link"></i>');
        var url = '/users/' + user + '/read';
        $.get(url, {readNotification: true});
      }
    }, 100)
  })
});
