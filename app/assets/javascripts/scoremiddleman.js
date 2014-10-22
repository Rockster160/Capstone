$(document).ready(function(){
  $('#pullscore').click(function(){
    var gamescore = $('#cheatinput').val()
    $('#cheatinput').val("");
    url = window.location.href;
    if (gamescore > 0) {
      $.get(url, {passScore: gamescore}, function(searchResults) {
        window.location = "/"
      })
    }
  });
})
