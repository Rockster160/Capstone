$(document).ready(function(){

  console.log($('#pullscore').length);
  $('#pullscore').click(function(){
    var gamescore = $('#cheatinput').val()
    $('#cheatinput').val("");
    url = window.location.href;
    console.log(gamescore);
    if (gamescore > 0) {
      $.get(url, {passScore : gamescore}, function(searchResults) {
        alert("Your score is: " + gamescore)
      })
    }
  });
})
