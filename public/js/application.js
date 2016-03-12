$(document).ready(function() {

  $('.title-form').on('submit', function(event){
    event.preventDefault();
      $(".title-form").hide();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    }).done(function(response){
      $(".survey-placeholder").replaceWith(response);
    })
  })

  $('.add-question-button').on('click', function(event){
    event.preventDefault();
    $('.add-question-button').hide();

    $.ajax({
      type: 'GET',
      url: '/questions/new'
    }).done(function(response){
      $(".question-placeholder").append(response);
    })
  })


  $('.question-placeholder').on('submit', '.question-form', function(event){
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    }).done(function(response){
      $(".question-placeholder").append(response);
      $('.question-form').trigger('reset');
    })
  })


  $('.add-choice-button').on('click', function(event){
    event.preventDefault();
    $('.add-choice-button').hide();

    $.ajax({
      type: 'GET',
      url: event.target
    }).done(function(response){
      console.log(response)
      $(".choice-placeholder").append(response);

    })
  })

  $('.choice-placeholder').on('submit', '.choice-form', function(event){
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    }).done(function(response){
      $(".choice-placeholder").append(response);
      $('.choice-form').trigger('reset');
    })
  })





}); //ready









