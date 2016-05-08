$(document).ready(function(){

  $(".favorite-program-btn-homepage").on("click", function(event){
      event.preventDefault();
      var $target = $(event.target);
      console.log("here")
      $.ajax({
        url: '/favorites',
        method: 'post',
      }).done(function(response){
        $("#login_or_register_form").html(response);
      }).fail(function(){
        console.log("ajax request failed")
      });
    });

});
