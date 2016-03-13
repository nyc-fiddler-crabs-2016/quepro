$(document).ready(function() {

  $('.title-form').on('submit', function(event){
    event.preventDefault();
      $(".title-form").hide();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    }).done(function(response){
      if ($.trim(response).length > 0) {
        $(".survey-placeholder").replaceWith(response);
      } else {
         $(".title-form").show();
      }
    })
  })

  $('body').on('click', '.add-question-button', function(event){
    event.preventDefault();
    $('.add-question-button').hide();

    $.ajax({
      type: 'GET',
      url: event.target
    }).done(function(response){
      $(".question-placeholder").append(response);
    });

    return false;
  })


  $('body').on('submit', '.question-form', function(event){
    event.preventDefault();
    var $this = $(this);

    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    }).done(function(response){
      $this.parent().append(response);
      $this.trigger('reset');
    });
  })


  $('body').on('click', '.add-choice-button', function(event){
    event.preventDefault();
    var $this = $(this);
    $this.hide();

    $.ajax({
      type: 'GET',
      url: event.target
    }).done(function(response){
      console.log(response)
      $this.siblings(".choice-placeholder").append(response);

    })
  })

  $('body').on('submit', '.choice-form', function(event){
    event.preventDefault();
    var $this = $(this);

    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()

    }).done(function(response){
      $this.parent().append(response);
      $this.trigger('reset');
    })
  })





}); //ready









