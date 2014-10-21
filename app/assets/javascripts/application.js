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
//=  require_tree

var open = false;

$(document).ready(function(){
  $('#clicksidebar').click(function(){
  x = $('#clicksidebar').position();
  var vpw = $(window).width();
  if (x > (vpw/2)) { open = false}
    if (open == false) {
      sidebarOpen();
      open = true;
    }
    else {
      sidebarClose();
      open = false;
    };
  });
});


function sidebarOpen() {
  $("#columnThree").animate({right: "0"}, "slow", "swing").show();
  $('#clicksidebar').animate({right: "50vw"}, "slow", "swing");
}

function sidebarClose() {
  $("#columnThree").animate({right: "-50vw"}, "slow", "swing");
  $('#clicksidebar').animate({right: "-5px"}, "slow", "swing");
}
