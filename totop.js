// in the footer add html:
//<a href="javascript:void(0)" id="totop"><em class="porto-icon-up-open"></em></a>

$(document).ready(function() {
    var windowScroll_t;
    $(window).scroll(function () {
        clearTimeout(windowScroll_t);
        windowScroll_t = setTimeout(function () {
            if (jQuery(this).scrollTop() > 100) {
                $('#totop').fadeIn();
            } else {
                $('#totop').fadeOut();
            }
        }, 500);
    });
    $('#totop').off("click").on("click", function () {
        $('html, body').animate({scrollTop: 0}, 600);
    });
});