$(document).ready(function() {

  $('.title-form').on('submit', function(event){
    event.preventDefault();
    alert('blocked')
      $(".title-form").hide();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    }).done(function(response){
      console.log(response)
      // debugger;
      $(".title-placeholder").replaceWith(response);
    })
  })
});









