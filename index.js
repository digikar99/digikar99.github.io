
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
    if (slides[slideIndex] == "") advanceSlides();
}

window.onload = function (e) {
    advanceSlides();
    setInterval(advanceSlides, 10000);
    setTimeout(advanceSlides, 1000);
};
