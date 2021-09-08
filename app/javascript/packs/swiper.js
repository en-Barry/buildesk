$(document).on('turbolinks:load', function() {

  const slideLength = document.querySelectorAll('.swiper .swiper-slide').length

  if (slideLength > 1) {
    const swiper = new Swiper('.swiper', {
      pagination: {
        el: '.swiper-pagination',
        clickable: true
      },
    });
  };
});