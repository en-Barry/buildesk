$(function() {
  $.ajax({
    url: "/search",
    type: "GET",　//getでsearchアクションにアクセス
    dataType: "json",
    data: { keyword: keyword },　//検索パラメーターの指定(:title)
  }).done(function (data) {
    $("#item_list").css("display", "");
    $("#item_list").html(data.items); //render json:{contents: contents}の内容表示
  });
  debugger;
});