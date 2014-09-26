$(document).ready(function() {

  $('#btn-upload').click(function() {

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
