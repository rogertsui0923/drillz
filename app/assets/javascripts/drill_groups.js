$(document).ready(function() {
  $('.show-form').hide();
  $(document).on('click', '.slide', function() {
    $(this).closest('.drill').find('.show-form').slideToggle();
  });
});
