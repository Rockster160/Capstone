if (window.location.href[window.location.href.length - 1] == "0") {window.location.href = "/index/home"}
$(document).ready(function(){

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
