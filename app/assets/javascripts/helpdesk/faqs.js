$(document).ready(function(){
  $('body').scrollspy({
    target: '.bs-docs-sidebar',
    offset: 40
  });

  $(".bs-docs-sidebar").affix({
    offset: {
      top: 122
    }
  });
});


