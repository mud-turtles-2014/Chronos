$(document).ready(function() {
  $('#capsule_form').hide();

  $('#btn-upload a').click(function(event) {
    event.preventDefault();
    $('#capsule_form').toggle();
  });


  $('#capsule_form form').submit(function(event) {
    event.preventDefault();

    $.ajax({
      url: $('#capsule_form form').attr("action"),
      type: 'POST',
      data: $(this).serialize()
    }).done(function(){
      $('body').append("<p>"+"GREAT SUCCESS!"+"</p>");
    });
  });


});

// function editButtonListener() {
//   $(".edit-button").on('click', function(event){

//   });
// };
