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
    $("#item_detail").empty();
  });

  // アイテムの選択
  $(document).on('click', '.item', function() {
    const item = $('.item-data', this).data();
    var item_image = '<div class="item-image"> <figure class="image is-5by4">'
    var item_name = '<div class="item-name">'
    var button = '<div class="field is-grouped"><p class="control"><button class="button is-success item-select">このアイテムを選択</button></p><p class="control"><button class="button back-to-page">検索結果に戻る</button></p></div>'
    $("#item_list").hide();
    $("#item_detail").append(`<div class="columns"><div class="column">` + item_image + `<img src="${item.image}"></figure></div></div>` + `<div class="column">` + item_name + `<p>${item.name}</p></div>` +　`<br></br>` + button + `</div></div>` + `<span class="detail-item-data" data-detail-item='{ "amazon_url":"${item.amazon_url}", "image":"${item.image}", "item_code":"${item.item_code}", "name":"${item.name}", "price":"${item.price}", "rakuten_url":"${item.rakuten_url}" }'></span>`);
    $(item).remove();
  });

  $(document).on('click', '.item-select', function() {
    // アイテムデータの変数を定義
    var select_item = $('.detail-item-data').data('detailItem');
    var item1 = $("#post_items1").val();
    var item2 = $("#post_items2").val();
    var item3 = $("#post_items3").val();
    var item4 = $("#post_items4").val();
    // アイテム表示用のHTML変数
    var card_image = '<div class="card-image"> <figure class="image is-5by4">'
    var card_content = '<div class="card-content"><div class="content">'
    // アイテムを5つまでフィールドに登録、表示
    if (item1 == "") {
      $("#post_items1").val(`{ item_code: "${select_item.item_code}", name: "${select_item.name}", price: "${select_item.price}", image: "${select_item.image}", rakuten_url: "${select_item.rakuten_url}", amazon_url: "${select_item.amazon_url}" }`);
      $("#item-results").append('<div class="column is-half-mobile is-one-third-desktop" id="item-id-1"><div class="card"><button class="delete" type="button" id="delete_button1"></button>' + card_image + `<img src="${select_item.image}"></figure></div>` + card_content + `<p>${select_item.name.substr(0, 20)}...</p>` + `<p>¥${select_item.price}</p></div></div></div>`);
    } else if (item1 != "" && item2 == "") {
      $("#post_items2").val(`{ item_code: "${select_item.item_code}", name: "${select_item.name}", price: "${select_item.price}", image: "${select_item.image}", rakuten_url: "${select_item.rakuten_url}", amazon_url: "${select_item.amazon_url}" }`);
      $("#item-results").append('<div class="column is-half-mobile is-one-third-desktop" id="item-id-2"><div class="card"><button class="delete" type="button" id="delete_button2"></button>' + card_image + `<img src="${select_item.image}"></figure></div>` + card_content + `<p>${select_item.name.substr(0, 20)}...</p>` + `<p>¥${select_item.price}</p></div></div>`)
    } else if (item1 != "" && item2 == "" && item3 == "") {
      $("#post_items3").val(`{ item_code: "${select_item.item_code}", name: "${select_item.name}", price: "${select_item.price}", image: "${select_item.image}", rakuten_url: "${select_item.rakuten_url}", amazon_url: "${select_item.amazon_url}" }`);
      $("#item-results").append('<div class="column is-half-mobile is-one-third-desktop" id="item-id-3"><div class="card"><button class="delete" type="button" id="delete_button3"></button>' + card_image + `<img src="${select_item.image}"></figure></div>` + card_content + `<p>${select_item.name.substr(0, 20)}...</p>` + `<p>¥${select_item.price}</p></div></div>`)
    } else if (item1 != "" && item2 == "" && item3 == "" && item4 == "") {
      $("#post_items4").val(`{ item_code: "${select_item.item_code}", name: "${select_item.name}", price: "${select_item.price}", image: "${select_item.image}", rakuten_url: "${select_item.rakuten_url}", amazon_url: "${select_item.amazon_url}" }`);
      $("#item-results").append('<div class="column is-half-mobile is-one-third-desktop" id="item-id-4"><div class="card"><button class="delete" type="button" id="delete_button4"></button>' + card_image + `<img src="${select_item.image}"></figure></div>` + card_content + `<p>${select_item.name.substr(0, 20)}...</p>` + `<p>¥${select_item.price}</p></div></div>`)
    } else {
      $("#post_items5").val(`{ item_code: "${select_item.item_code}", name: "${select_item.name}", price: "${select_item.price}", image: "${select_item.image}", rakuten_url: "${select_item.rakuten_url}", amazon_url: "${select_item.amazon_url}" }`);
      $("#item-results").append('<div class="column is-half-mobile is-one-third-desktop" id="item-id-5"><div class="card"><button class="delete" type="button" id="delete_button5"></button>' + card_image + `<img src="${select_item.image}"></figure></div>` + card_content + `<p>${select_item.name.substr(0, 20)}...</p>` + `<p>¥${select_item.price}</p></div></div>`)
    };
    // モーダル表示の切り替え
    $(".modal").removeClass("is-active");
    $("#item_list").empty();
    $("#item_detail").empty();
    $(select_item).remove();
  });

  // アイテムのキャンセル
  $(document).on('click', "#delete_button1", function() {
    $('#post_items1').val("");
    $('#item-id-1').remove();
  });

  $(document).on('click', "#delete_button2", function() {
    $('#post_items2').val("");
    $('#item-id-2').remove();
  });

  $(document).on('click', "#delete_button3", function() {
    $('#post_items3').val("");
    $('#item-id-3').remove();
  });

  $(document).on('click', "#delete_button4", function() {
    $('#post_items4').val("");
    $('#item-id-4').remove();
  });

  $(document).on('click', "#delete_button5", function() {
    $('#post_items5').val("");
    $('#item-id-5').remove();
  });

  // 詳細画面から検索一覧に戻る
  $(document).on('click', '.back-to-page', function () {
    $("#item_list").show();
    $("#item_detail").html('');
  });
});