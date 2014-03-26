// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).on('page:load', function () {
        $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
        // root 'ip_addresses#index'
        if (this.location.pathname == '/tickets') {
          $('a[href="/"]').parent().addClass('active');
        }
});

// $(document).on('page:load', function () {
//         $('.page.current').parent().addClass('active');
// });

// $('tr[data-link]').on('click', function() {
//   // window.location = this.data("link")
//   window.document.location = $(this).attr('data-link');
// });

// jQuery(document).on('page:load', function($) {
//       $("tr[href]").click(function() {
//             window.document.location = $(this).attr("href");
//       });
// });

// jQuery(document).on('page:load', function($) {
//       $('tr[data-link]').click(function() {
//             window.document.location = $(this).attr('data-link');
//       });
// });

// $('tr[data-link]').on('click', function() {
//     window.location = $(this).find('a').attr('href');
// });
