//= require modernizr
//= require jquery
//= require jquery_ujs
//= require bootstrap
//

$(function() {
  $('div.main').hover(
    function() { $('.sidebar .sidecontent').hide(); }, 
    function() { $('.sidebar .sidecontent').fadeIn(); }
  );

  var character = /@([^\s^:^.^,^<]+)/g;
  var pedia = /#([^\s^:^.^,^<]+)/g;
  $('.scene .content').each(function() {
    var html = $(this).html();
    var mod = html.replace(character, '<a href="/personajes/@$1">@$1</a>');
    mod = mod.replace(pedia, '<a href="/enciclopedia/%23$1">#$1</a>');
    $(this).html(mod);
  });
});
