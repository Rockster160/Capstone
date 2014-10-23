$(document).ready(function(){

  $('#pullscore').click(function(){
    var gamescore = $('#cheatinput').val()
    $('#cheatinput').val("");
    url = window.location.href;
    if (gamescore >= 0) {
      $.get(url, {passScore: gamescore}, function(searchResults) {
        window.location = "/"
      })
    }
  });

  $('#btn-input').click(function(){
    var shout_text = $('#shout-area').val()
    $('#shout-area').val("");
    url = window.location.href;
    if (shout_text >= 0) {
      $.get(url, {passScore: shout_text}, function(searchResults) {
        //Slide in Prepend shout_text
        //Slide out $(.shout-wrapper).last
      })
    }
  });
})
