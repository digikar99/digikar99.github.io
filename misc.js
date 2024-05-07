
var LINK_LIST = [];

// Credits: https://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array
function shuffle(array) {
  let currentIndex = array.length;

  // While there remain elements to shuffle...
  while (currentIndex != 0) {

    // Pick a remaining element...
    let randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;

    // And swap it with the current element.
    [array[currentIndex], array[randomIndex]] = [
      array[randomIndex], array[currentIndex]];
  }
}

function random_links(e){
    console.log("Random ran!");
    const ul = document.createElement("ul");

    ul.classList.add("org-ul");
    const link_list_copy = [...LINK_LIST];
    shuffle(link_list_copy);
    console.log(ul);

    for(let i=0; i<5; i++){
        console.log(link_list_copy[i]);
        ul.appendChild(link_list_copy[i]);
    }

    const random_articles = document.getElementsByClassName("random-articles")[0];
    random_articles.innerHTML = "";
    random_articles.appendChild(ul);
};

function collect_links(){
    const articles = document.getElementById("articles").parentElement;
    const sections = articles.getElementsByClassName("outline-3");

    function section_title(section){
        return section.getElementsByTagName("h3")[0].innerText;
    };
    function section_links(section){
        return section.getElementsByTagName("li");
    }
    function add_title_to_link(title, link){
        link = link.cloneNode(true);
        const link_a = link.getElementsByTagName("a")[0];
        link_a.innerHTML = `<em>[${title}]</em> ${link_a.innerText}`;
        return link;
    }

    for(let i=0; i<sections.length; i++){
        const title = section_title(sections[i]);
        if (title === "Random") continue;
        const links = section_links(sections[i]);
        var links_with_tags = [];
        for(let j=0; j<links.length; j++){
            links_with_tags = links_with_tags.concat(add_title_to_link(title, links[j]));
        }
        LINK_LIST = LINK_LIST.concat(...links_with_tags);
    }
};

window.onload = function(){
    collect_links();
    document.getElementById("show-random-articles").onclick = random_links;
    random_links(null);
};
