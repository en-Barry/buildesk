const { Collapse } = require("bootstrap");

$(function() {

  // モーダルの表示・非表示
  $(document).on('click', '#item-search-show', function() {
    $(".modal").toggleClass("is-active");
  });

  $(document).on('click', ('.delete, .modal-background'), function() {
    $(".modal").removeClass("is-active");
  });

  // 商品検索
  $(document).on('click', '#js-search-button', function(e) {
    e.preventDefault();
    var keyword = $('#js-search-keyword').val();
    $.ajax({
      url: '/search',
      type: "GET",
      async: true,
      data: { keyword: keyword },　//検索パラメーターの指定(:keyword)
    }).done(function (data) {
      $("#item_list").css("display", "");
    });
    $('#js-search-keyword').val('');
  });

  // アイテムの選択、キャンセル
  $(document).on('click', '.item', function() {
    const item = $('.item-data', this).data();
    $("#item_list").hide();
    $("#item_detail").append(`商品名　${item.name}` + `<span class="item-data" data-amazon_url="${item.amazon_url}" data-image="${item.image}" data-item_code="${item.item_code}" data-name="${item.name}" data-price="${item.price}" data-rakuten_url="${item.rakuten_url}"></span>` + `<div class="button is-success item-select">このアイテムを選択</div>` + `<div class="button back-to-page">検索結果に戻る</div>`);
    $(item).remove();
  });

  $(document).on('click', '.item-select', function() {
    $(".modal").removeClass("is-active");
    $("#item_list").empty();
    $("#item_detail").empty();
  });

  $(document).on('click', '.back-to-page', function () {
    $("#item_list").show();
    $("#item_detail").html('');
  });
});