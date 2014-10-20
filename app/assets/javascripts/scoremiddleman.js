$(document).ready(function(){

  console.log($('#pullscore').length);
  $('#pullscore').click(function(){
    var gamescore = $('#cheatinput').val()
    $('#cheatinput').val("")
    console.log(gamescore)
  });
})
