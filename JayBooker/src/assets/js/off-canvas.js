(function($) {
  'use strict';
  $(function() {
    $('body').on("click", '[data-toggle="offcanvas"]', function() {
      $('.sidebar-offcanvas').toggleClass('active')
    });
  });
})(jQuery);
//[data-toggle="offcanvas"] remplacé par body et ajouté après "click"
