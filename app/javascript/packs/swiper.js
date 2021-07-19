$(document).on('turbolinks:load', function() {

  const slideLength = document.querySelectorAll('.swiper-container .swiper-slide').length

  if (slideLength > 1) {
    const swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        clickable: true
      },
    });
  };
});