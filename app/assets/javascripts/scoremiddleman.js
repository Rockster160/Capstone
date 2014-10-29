$(document).ready(function(){
  $('#pullscore').click(function(){
    scorePull(-1);
  });
  $('#cheatbtn').click(function(){
    scorePull($('#cheatinput').val());
  })

})

function scorePull(x) {
  if (x == -1) {
    if (score_high > score_low) {
      var mid = score_high / 2;
      rng = ((Math.random() * score_high) + (Math.random() * score_high) + (Math.random() * score_high) + (Math.random() * score_high)) / 4;
      rng = Math.round(rng);
      grab = -2;//Math.round((Math.random() * score_high) + score_low);
      if (rng == grab) {
        rng = score_high;
        console.log("They match!! It happened!!");
      };
    } else {
      console.log("Error! High is lower than low...")
    };
    $('#cheatinput').val(rng);
  }
  var gamescore = $('#cheatinput').val()
  url = window.location.href;
  if (gamescore.length > 0) {
    $.get(url, {passScore: gamescore}, function() {
      window.location = "/";
    })
  }
}
