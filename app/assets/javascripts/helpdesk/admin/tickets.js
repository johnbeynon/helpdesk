// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    $('a[href*="#"]').click(function(){
        $($(this).attr("href")).effect("highlight", {}, 1500);
    });
});