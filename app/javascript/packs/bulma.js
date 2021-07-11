$(document).ready(function() {

  // Check for click events on the navbar burger icon
  $(document).on('click', '.navbar-burger', function() {
    // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
    $(".navbar-burger").toggleClass("is-active");
    $(".navbar-menu").toggleClass("is-active");
  });

  $(document).on('click', '.dropdown-trigger', function() {
    $(".dropdown").toggleClass("is-active");
  });
});