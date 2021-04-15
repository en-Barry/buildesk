$(function() {
  $(document).on('click', ".item-search-show", function() {
    $('#item-search-modal').fadeIn('fast');
  });
  
  $(document).on('click', "#close-modal", function() {
    $('#item-search-modal').fadeOut('fast');
  });

  $(document).on('click', '.item-search-modal-wrapper', function() {
    $('#item-search-modal').fadeOut('fast');
  });
});