$(document).ready(function(){


  $('.gamebutton').click(function(){
    var my_id = $(this).attr('id');
    var url = window.location.href;
     $.get(url,{passId : my_id}).done(function() {
      //  alert("done!");
      console.log(my_id);
        $('#gameDirect').modal();
     });
   });
});


// <li><a href="/games/<%= Game.find(@user.favorites[fav]).id %>"><%= image_tag(Game.find(@user.favorites[fav]).ava, id: "user-fav") %></a></li>
//href="/games/<%= Game.find(@user.favorites[fav]).id %>"
