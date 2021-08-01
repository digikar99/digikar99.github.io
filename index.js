
window.onload = function (e) {
    var VW = document.documentElement.clientWidth / 100;
    console.log('fired!');
    var HEADER = document.getElementsByClassName('defining-pic')[0];
    var STICKY = VW * 35;
    console.log("width", STICKY);
    window.onscroll = function (e) {
        console.log('scroll');
        if (window.pageYOffset > STICKY) {
            return HEADER.classList.add('sticky');
        }else{
            return HEADER.classList.remove('sticky');
        }
    };
};
