window.onload = function () {
    var paper = new Raphael(document.getElementById('floor_plan'), 800, 1100);

    first_floor_drawables = create_first_floor_drawables(paper);
    second_floor_drawables = create_second_floor_drawables(paper);
    hide_all(first_floor_drawables);
    hide_all(second_floor_drawables);

    show_all(first_floor_drawables);

    $( "#first_floor" ).click(function() {
        hide_all(second_floor_drawables);
        show_all(first_floor_drawables);
    });

    $( "#second_floor" ).click(function() {
        hide_all(first_floor_drawables);
        show_all(second_floor_drawables);
    });


}



function create_first_floor_drawables(paper) {

    var first_floor_drawables = [];

    // Background
    first_floor_drawables.push(paper.rect(0, 0, 800, 1100).attr({"fill":"white", "stroke": "white", "stroke-width":"0"}));

    // Outline
    first_floor_drawables.push(paper.path("M 200 0 l 600 0 l 0 1100 l -600 0 l -200 -130 l 0 -840 z").attr({"stroke-width":"10px", "stroke":"#289784"}));

    // Stage
    first_floor_drawables.push(paper.path("M 300 0 l -300 200").attr({"stroke-width":"6px", "stroke":"#289784"}));

    // Stage label
    first_floor_drawables.push(paper.text(120, 85, "Musik").attr(
        {"font-family":"arial",
            "font-size":"40",
            "text-align":"left",
            "fill":"#289784"}
    ).rotate(-34));

    // Bar
    first_floor_drawables.push(paper.rect(740, 450, 60, 250).attr({"stroke-width":"6px","stroke":"#289784"}));

    // Bar label
    first_floor_drawables.push(paper.text(770, 580, "Bar").attr(
        {"font-family":"arial",
            "font-size":"40",
            "text-align":"left",
            "fill":"#289784"}
    ).rotate(-90));

    // Tables
    first_floor_drawables.push(paper.rect(620, 270, 150, 100).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.rect(620, 30, 150, 200).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.rect(200, 80, 100, 100).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}).rotate(-34));
    first_floor_drawables.push(paper.circle(470, 110, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.rect(30, 260, 200, 150).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.circle(130, 530, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.rect(30, 650, 200, 150).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.circle(150, 920, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.rect(300, 870, 150, 200).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.circle(580, 970, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));

    return first_floor_drawables;
}

function create_second_floor_drawables(paper) {

    var second_floor_drawables = [];

    // Background
    second_floor_drawables.push(paper.rect(0, 0, 800, 1100).attr({"fill":"white", "stroke": "white", "stroke-width":"0"}));

    // Outline
    second_floor_drawables.push(paper.path("M 200 0 l 600 0 l 0 1100 l -600 0 l -200 -130 l 0 -840 z").attr({"stroke-width":"10px", "stroke":"#289784"}));

    // Bar
    second_floor_drawables.push(paper.rect(430, 720, 370, 60).attr({"stroke-width":"6px","stroke":"#289784"}));

    // Bar label
    second_floor_drawables.push(paper.text(610, 750, "Bar").attr(
        {"font-family":"arial",
            "font-size":"40",
            "text-align":"left",
            "fill":"#289784"}
    ));

    // Tables
    second_floor_drawables.push(paper.circle(630, 110, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(340, 30, 150, 200).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.circle(200, 140, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(30, 260, 200, 150).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.circle(130, 530, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(30, 650, 200, 150).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.circle(150, 920, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(290, 970, 150, 100).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(670, 540, 100, 150).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(430, 540, 200, 150).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"}));

    return second_floor_drawables;
}

function hide_all(array_of_drawables) {
    for(var i = 0; i < array_of_drawables.length; i++) {
        array_of_drawables[i].hide();
    }
}

function show_all(array_of_drawables) {
    for(var i = 0; i < array_of_drawables.length; i++) {
        array_of_drawables[i].show();
    }
}


