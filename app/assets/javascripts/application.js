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
//= require jquery
//= require activestorage
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function() {
    $('.inactive').prop("checked",true);   
    });
  

$(document).ready(function() {
    $('.inactive').click(function(event){
      var select = $('.status');
      select.empty();
      select.append('<option value="">New</option>');
      select.append('<option value="">Started</option>');
      select.append('<option value="">Completed</option>');
    });
  }
)

$(document).ready(function() {
    $('.active').click(function(event){
      var select = $('.status');
      select.empty();
      select.append('<option value="">New</option>');
      select.append('<option value="">Started</option>');
      select.append('<option value="">Resolved</option>');
    });
  }
)