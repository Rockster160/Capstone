$(document).ready(function(){
  $('#pullscore').click(function(){
    if ($('#cheatinput').val().length == 0) {
      // alert(score_low + ", " + score_high);
      if (score_high < score_low) {
        var holdhigh = score_high;
        var holdlow = score_low;
        score_high = holdlow;
        score_low = holdhigh;
      };
      if (score_high > score_low) {
        var mid = score_high / 2;
        rng = ((Math.random() * score_high) + (Math.random() * score_high) + (Math.random() * score_high)) / 3;
        rng = Math.round(rng);
        grab = Math.round((Math.random() * score_high) + score_low);
        if (rng == grab) {
          rng = score_high;
          console.log("They match!! It happened!!");
        };
      } else {
        console.log("Error! High is lower than low...")
      };
      // console.log(rng + ", " + grab);
      $('#cheatinput').val(rng);
    }
    var gamescore = $('#cheatinput').val()
    url = window.location.href;
    if (gamescore.length > 0) {
      $.get(url, {passScore: gamescore}, function() {
        window.location = "/";
      })
    }
  });

})
