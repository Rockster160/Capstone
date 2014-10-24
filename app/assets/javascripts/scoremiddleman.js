$(document).ready(function(){

  $('#pullscore').click(function(){
    $('#cheatinput').val("");
    // alert(score_low + ", " + score_high);
    if (score_high > score_low) {
      var mid = score_high / 2;
      rng = (Math.random() * mid) + mid /2;
    };
    if (score_high < score_low) {
      rng = (Math.random() * score_low) + score_high;
    };
    console.log(rng);
    $('#cheatinput').val();
    var gamescore = $('#cheatinput').val()
    url = window.location.href;
    if (gamescore.length > 0) {
      $.get(url, {passScore: gamescore}, function(searchResults) {
        window.location = "/"
      })
    }
  });

})
