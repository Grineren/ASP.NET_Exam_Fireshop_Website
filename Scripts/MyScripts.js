$(document).ready(function () {

    
    //fancybox
    $("a#single_image").fancybox();


    //Vis tekst ved klik på link 
    $('.link').click(function () {
        
        var id = $(this).attr("rel");

        $('#' + id).slideToggle('slow');
    });

});