$(function() {
  $(document).on('click', "#item-search-show", function() {
    $('#item-search-modal').fadeIn('fast');
    $('.modal').show();
  });
  
  $(document).on('click', "#close-modal", function() {
    $('#item-search-modal').fadeOut('fast');
    $('#item_list').empty();
  });

  // $(document).on('click', '.item-search-modal-wrapper', function() {
  //   $('#item-search-modal').fadeOut('fast');
  // });

});