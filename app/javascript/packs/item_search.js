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
      type: "GET",
      dataType: "json",
      async: true,
      data: { keyword: keyword },　//検索パラメーターの指定(:keyword)
    }).done(function (data) {
      var items = data.contents
      $("#item_list").html('');
      $.each(items, function(index, val) {
        $("#item_list").append(`<div class="search-item item">` + `<img src=` + `"${val.image}" width="150" height="150">` + `<p></p>` + val.name + `<p></p>` + `¥` + val.price + `</div>`);
      });
      //$("#item_list").css("display", "");
      //$("#item_list").html(data.contents); //render json:{contents: contents}の内容表示
    });
    $('#js-search-keyword').val('');
  });

  $(this).on('click', '.item', function() {
    var item = $(this)
    $('#item_list').hide();
    $('#item-search-box').hide();
    $('#item_detail').append(item);
  });

  $(document).on('click', '#close-modal', function() {
    $('#item-search-modal').hide();
    $('#item_list').empty();
  });

  // $(document).on('click', '.item-search-modal-wrapper', function() {
  //   $('#item-search-modal').fadeOut('fast');
  // });

});