$(document).ready(function(){

  $(".favorite-program-btn-homepage").on("click", function(event){
      event.preventDefault();
      var $target = $(this);
      var organization = $target.parent().parent().find(".panel-heading").text()
      var data = {organization: organization}
      $.ajax({
        url: '/favorites',
        method: 'post',
        data: data,
      }).done(function(response){
        $target.removeClass();
        $target.addClass("btn btn-warning btn-circle unfavorite-program-btn-homepage");
        $target.children().removeClass();
        $target.children().addClass("fa fa-times");
      }).fail(function(){
        console.log("ajax request failed")
      });
    });

    $(".unfavorite-program-btn-homepage").on("click", function(event){
        event.preventDefault();
        var $target = $(this);
        debugger;
        var organization = $target.parent().parent().find(".panel-heading").text()
        var data = {organization: organization}
        $.ajax({
          url: '/favorites/1',
          method: 'delete',
          data: data,
        }).done(function(response){
          $target.removeClass();
          $target.addClass("btn btn-danger btn-circle favorite-program-btn-homepage");
          $target.children().removeClass();
          $target.children().addClass("fa fa-heart");
        }).fail(function(){
          console.log("ajax request failed")
        });
      });

});
