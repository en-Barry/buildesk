$(function() {
  $(document).on('click', '#item-search-show', function() {
    $('#item-search-modal').show();
    $('.modal').show();
  });

  $(document).on('click', '#js-search-button', function(e) {
    e.preventDefault();
    var keyword = $('#js-search-keyword').val();
    $.ajax({
      url: '/search',
      type: "GET",　//getでsearchアクションにアクセス
      dataType: "json",
      async: true,
      data: { keyword: keyword },　//検索パラメーターの指定(:title)
    }).done(function (data) {
      $("#item_list").css("display", "");
      $("#item_list").html(data.contents); //render json:{contents: contents}の内容表示
    });
    $('#js-search-keyword').val('');
  });

  $(document).on('click', '#close-modal', function() {
    $('#item-search-modal').hide();
    $('#item_list').empty();
  });

  $(this).on('click', '.item', function() {
    $('#item_list').hide();
    $('#item-search-box').hide();
    $('#item_detail').show();
    debugger
  });

  // $(document).on('click', '.item-search-modal-wrapper', function() {
  //   $('#item-search-modal').fadeOut('fast');
  // });

});