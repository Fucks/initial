$(document).on('scroll', function () {
    // if the scroll distance is greater than 100px
    if ($(window).scrollTop() > 40) {
        // do something
        $('.site-header').addClass('scrolled-header');
    } else {
        $('.site-header').removeClass('scrolled-header');
    }
});