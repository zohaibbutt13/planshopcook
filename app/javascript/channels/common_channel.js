$(document).on('turbolinks:load', function () {
  $('.js-select2-dropdown').select2({
    placeholder: " "
  });

  $('.js-select2-dropdown-container select').select2({
    placeholder: " "
  })

  setTimeout(function(){
    $('.js-flash-messages-wrapper').css("top", "13%");
  }, 500);
});