$(document).ready(function(){

  $("#sign-in-button").on("click", function(event){
      event.preventDefault();
      var $target = $(event.target);
      $.ajax({
        url: '/sessions/new',
        method: 'get',
      }).done(function(response){
        $("#login_or_register_form").html(response);
      }).fail(function(){
        console.log("ajax request failed")
      });
    });

    $("#register-button").on("click", function(event){
        event.preventDefault();
        var $target = $(event.target);
        $.ajax({
          url: '/users/new',
          method: 'get',
        }).done(function(response){
          $("#login_or_register_form").html(response);
        }).fail(function(){
          console.log("ajax request failed")
        });
      });

});
