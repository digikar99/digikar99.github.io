
var slides;
var quotes_request = new Request("random-quotes.txt");
fetch(quotes_request).then(function(response) {
    return response.text().then(function(text) {
        slides = text.split("\n");
    });
});

function advanceSlides(){
    var slidesContainer = document.getElementsByClassName("slideshow-container")[0];
    var numSlides = slides.length;
    var slideIndex = Math.floor(Math.random() * numSlides);
    if (slideIndex >= numSlides) slideIndex = 0;
    slidesContainer.innerHTML = "<quote>\"" + slides[slideIndex] + "\"</quote>";
}

window.onload = function (e) {
    var VW = document.documentElement.clientWidth / 100;
    // console.log('fired!');
    var HEADER = document.getElementsByClassName('defining-pic')[0];
    var STICKY = VW * 35;
    // console.log("width", STICKY);
    window.onscroll = function (e) {
        // console.log('scroll');
        if (window.pageYOffset > STICKY) {
            return HEADER.classList.add('sticky');
        }else{
            return HEADER.classList.remove('sticky');
        }
    };

    setInterval(advanceSlides, 10000);
    setTimeout(advanceSlides, 1000);
};
