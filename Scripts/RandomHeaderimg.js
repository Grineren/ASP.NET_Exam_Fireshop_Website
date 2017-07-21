$(document).ready(function () {




    var images = ['headerimage1.jpg', 'headerimage2.jpg', 'headerimage3.jpg', 'headerimage4.jpg', 'headerimage5.jpg'];
    $('header').css({ 'background-image': 'url(Billeder/header_images/' + images[Math.floor(Math.random() * images.length)] + ')' });



});