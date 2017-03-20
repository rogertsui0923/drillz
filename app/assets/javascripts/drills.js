$(document).ready(function() {
  // $('.solution').hide();
  $(document).on('click', 'solution-trigger', function() {
    $('.solution').toggleClass('hide');
    // $(this).closest('.drill-solutions').find('.show-solutions').slideToggle();
  });
});
