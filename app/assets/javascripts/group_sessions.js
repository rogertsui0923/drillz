$(document).ready(function() {
  $('.show-solutions').hide();
  $(document).on('click', '.drill .solutions', function() {
    $(this).closest('.drill-solutions').find('.show-solutions').slideToggle();
  });
});
