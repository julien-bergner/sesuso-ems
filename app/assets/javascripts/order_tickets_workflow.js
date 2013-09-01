window.onload = function () {
    var paper = new Raphael(document.getElementById('floor_plan'), 850, 1200);

    first_floor_drawables = create_first_floor_drawables(paper);
    second_floor_drawables = create_second_floor_drawables(paper);

}



function create_first_floor_drawables(paper) {

    var first_floor_drawables = [];

    var x_offset = 0;
    var y_offset = 50;

    // Label
    first_floor_drawables.push(paper.text(x_offset + 200, y_offset - 25, "Erdgeschoss").attr(
        {"font-family":"arial",
            "font-weight":"900",
            "font-size":"25",
            "text-align":"left",
            "fill":"#289784"}
    ));


    // Background
    first_floor_drawables.push(paper.rect(x_offset + 0, y_offset + 0, 400, 550).attr({"fill":"white", "stroke": "white", "stroke-width":"0"}));

    // Outline
    first_floor_drawables.push(paper.path("M " + (x_offset + 100) + " " + (y_offset + 0) + " l 300 0 l 0 550 l -300 0 l -100 -65 l 0 -420 z").attr({"stroke-width":"6px", "stroke":"#289784"}));

    // Stage
    first_floor_drawables.push(paper.path("M " + (x_offset + 150) + " " + (y_offset + 0) + " 0 l -150 100").attr({"stroke-width":"5px", "stroke":"#289784"}));

    // Stage label
    first_floor_drawables.push(paper.text(x_offset + 60, y_offset + 42, "Musik").attr(
        {"font-family":"arial",
            "font-size":"22",
            "text-align":"left",
            "fill":"#289784"}
    ).rotate(-34));

    // Bar
    first_floor_drawables.push(paper.rect(x_offset + 370, y_offset + 225, 30, 125).attr({"stroke-width":"5px","stroke":"#289784"}));

    // Bar label
    first_floor_drawables.push(paper.text(x_offset + 385, y_offset + 290, "Bar").attr(
        {"font-family":"arial",
            "font-size":"25",
            "text-align":"left",
            "fill":"#289784"}
    ).rotate(-90));

    // Tables
    first_floor_drawables.push(paper.rect(x_offset + 310, y_offset + 135, 75, 50).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.rect(x_offset + 310, y_offset + 15, 75, 100).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.rect(x_offset + 100, y_offset + 40, 50, 50).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}).rotate(-34));
    first_floor_drawables.push(paper.circle(x_offset + 235, y_offset + 55, 40).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.rect(x_offset + 15, y_offset + 130, 100, 75).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.circle(x_offset + 65, y_offset + 265, 40).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.rect(x_offset + 15, y_offset + 325, 100, 75).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.circle(x_offset + 75, y_offset + 460, 40).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.rect(x_offset + 150, y_offset + 435, 75, 100).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    first_floor_drawables.push(paper.circle(x_offset + 290, y_offset + 485, 40).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));

    return first_floor_drawables;
}

function create_second_floor_drawables(paper) {

    var second_floor_drawables = [];

    var x_offset = 430;
    var y_offset = 50;

    // Label
    second_floor_drawables.push(paper.text(x_offset + 200, y_offset -25, "Obergeschoss").attr(
        {"font-family":"arial",
            "font-weight":"900",
            "font-size":"25",
            "text-align":"left",
            "fill":"#289784"}
    ));

    // Background
    second_floor_drawables.push(paper.rect(x_offset + 0, y_offset + 0, 400, 550).attr({"fill":"white", "stroke": "white", "stroke-width":"0"}));

    // Outline
    second_floor_drawables.push(paper.path("M " + (x_offset + 100) + " " + (y_offset + 0) + " l 300 0 l 0 550 l -300 0 l -100 -65 l 0 -420 z").attr({"stroke-width":"6px", "stroke":"#289784"}));

    // Bar
    second_floor_drawables.push(paper.rect(x_offset + 215, y_offset + 360, 185, 30).attr({"stroke-width":"5px","stroke":"#289784"}));

    // Bar label
    second_floor_drawables.push(paper.text(x_offset + 305, y_offset + 375, "Bar").attr(
        {"font-family":"arial",

            "font-size":"25",
            "text-align":"left",
            "fill":"#289784"}
    ));

    // Tables
    second_floor_drawables.push(paper.circle(x_offset + 315, y_offset + 55, 40).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(x_offset + 170, y_offset + 15, 75, 100).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.circle(x_offset + 100, y_offset + 70, 40).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(x_offset + 15, y_offset + 130, 100, 75).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.circle(x_offset + 65, y_offset + 265, 40).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(x_offset + 15, y_offset + 325, 100, 75).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.circle(x_offset + 75, y_offset + 460, 40).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(x_offset + 145, y_offset + 485, 75, 50).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(x_offset + 335, y_offset + 270, 50, 75).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));
    second_floor_drawables.push(paper.rect(x_offset + 215, y_offset + 270, 100, 75).attr({"stroke-width":"5px", "fill":"#289784", "stroke":"#289784"}));

    return second_floor_drawables;
}



