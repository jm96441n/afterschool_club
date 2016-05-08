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

    $("#page-wrapper").on("click", ".unfavorite-program-btn-homepage", function(event){
        event.preventDefault();
        var $target = $(this);
        var organization = $target.parent().parent().find(".panel-heading").text()
        var data = {organization: organization}
        var fav_uri = "/favorites/" + $target.data().id
        $.ajax({
          url: fav_uri,
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
