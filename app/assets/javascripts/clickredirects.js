url = window.location.href
if (url[url.length - 1] == "0" && url[url.length - 2] == "/") {window.location.href = "/index/home"};
if (url.substr(url.length - 7) == "sign_in" || url.substr(url.length - 7) == "sign_up" || url[url.length - 1] == "/") {window.location.href = "/index/home"};
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
  $('.kill-it').click(function(){
    window.location.reload();
    // $(this).offsetParent.html("");
  })

})
