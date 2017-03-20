$(document).ready(function() {
  $('.show-solutions').hide();
  $(document).on('click', '.overall-results .solutions-result', function() {
    console.log('hi')
    $(this).closest('.drill-solutions').find('.show-solutions').slideToggle();
  });
});
