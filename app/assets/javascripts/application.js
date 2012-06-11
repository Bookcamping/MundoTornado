//= require modernizr
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require mentions
//

$(function() {
  $('div.main').hover(
    function() { $('.sidebar .sidecontent').hide(); }, 
    function() { $('.sidebar .sidecontent').fadeIn(); }
  );
});
