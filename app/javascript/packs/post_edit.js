$(function() {
  // 画像のプレビュー表示
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#post_img_prev').attr('src', e.target.result);
        $('#delete-img').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#post_images").change(function(){
      readURL(this);
  });

  // 画像の削除
  $(document).on('click', '#delete-img', function() {
    var target_image = $(this).parent().parent()
    target_image.remove();
    file_field.val('');
  });
  
  // ファイルアップロード時にファイル名を表示
  const fileInput = document.querySelector('#post-file-upload input[type=file]');
  fileInput.onchange = () => {
    if (fileInput.files.length > 0) {
      const fileName = document.querySelector('#post-file-upload .file-name');
      fileName.textContent = fileInput.files[0].name;
    }
  }
});
