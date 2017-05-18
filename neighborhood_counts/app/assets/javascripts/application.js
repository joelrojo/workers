// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  var checkWorkerDone = function() {
    $.get($("#loading").data('check-url')).done(function(response) {
      if (response.complete) { 
        $("#loading").hide();
        $("#results").append(response.html);
      } else {
        setTimeout(checkWorkerDone, 1000);
      }
    });
  }

  $("form#hood-search").on("submit", function(event){
    event.preventDefault();

    $("#loading").show();
    $("#results").html('');
    var form = $(this);

    $.ajax({
      type: this.method,
      url: this.action,
      data: form.serialize()
    })
    .done(function(response){
      console.log(response)
      if (response.complete) {
        $("#loading").hide();
        $("#results").append(response.html);
      } else {
        $("#loading").data('check-url', "/jobs/" + response.id)
        checkWorkerDone();
      }
    });
  });


  
});