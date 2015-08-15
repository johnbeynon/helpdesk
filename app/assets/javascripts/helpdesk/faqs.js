$(document).ready(function(){
  $('body').scrollspy({
    target: '.bs-docs-sidebar',
    offset: 80
  });

  $(".bs-docs-sidebar").affix({
    offset: {
      top: 122
    }
  });
});


