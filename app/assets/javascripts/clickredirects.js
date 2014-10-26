$(document).ready(function(){
  $('#avatar').click(function(){
    window.location.href = "/";
  });

  $('#trophy-button').click(function() {
    console.log("Clicked!");
    child = $('#trophy-button').find('#trophies');
    alert(child);
  })
    // var el = document.getElementById(id);
    // if (el.style.display == "block") {
    //     el.style.display = "none";
    // } else {
    //     el.style.display = "block";
    // }
})
