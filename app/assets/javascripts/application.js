// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

var open = false;

$(document).ready(function(){
  alert("Document Ready!");
  $('#clicksidebar').click(function(){
    if (open == false) {
      open = true;
      sidebarOpen();
    }
    else {
      open = false;
      sidebarClose();
    }
    alert(open);
  });
});

function sidebarOpen() {
  var c3 = $("#columnThree")
  c3.css({right:-50vw,top:20vh});
  c3.animate({right:0},"fast");
}

function sidebarClose() {

}
