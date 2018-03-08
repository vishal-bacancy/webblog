// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require ckeditor/init
//= require jquery
//= require jquery_ujs
//= require jquery.easy-autocomplete
//= require_tree .
function change(target,caller){
	
if (document.getElementById(target).style.display === "none"){
document.getElementById(target).style.display = "block";
document.getElementById(caller).innerHTML = "hide";
}
else
{
document.getElementById(target).style.display = "none";
document.getElementById(caller).innerHTML = "comment";
}

}

$(document).ready(function(){
$('.header-list').find('li').css({display: "inline"});

$('.menu').on('click',function(){
	$('#blogDisplayType').slideToggle();

});
$input = $("[data-behavior='autocomplete']")

  var options = {
    getValue: "name",
    url: function(phrase) {
      return "/search.json?term=" + phrase;
    },
    categories: [
      {
        listLocation: "blogs",
        header: "<strong>Blogs</strong>",
      },
      {
        listLocation: "users",
        header: "<strong>Users</strong>",
      }
    ],
    list: {
      onChooseEvent: function( ) {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    }
  }

  $input.easyAutocomplete(options)

});

