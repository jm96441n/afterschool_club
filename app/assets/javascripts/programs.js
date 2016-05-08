$(document).ready(function(){

  $(".modal-toggler").on("click", function(event){
      event.preventDefault();
      var id = $(this).attr('data-id');
     	$.get(id, function(data) {
     	debugger;
     // Handle the result
     $('.modal-body').append(data);
   });
		$("#myModal").modal({show: true});
    });
});

