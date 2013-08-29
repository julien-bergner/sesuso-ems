window.onload = function () {
    var paper = new Raphael(document.getElementById('floor_plan'), 800, 1100);

    var background = paper.rect(0, 0, 800, 1100).attr({"fill":"white", "stroke": "white", "stroke-width":"0"});


    var outline = paper.path("M 200 0 l 600 0 l 0 1100 l -600 0 l -200 -130 l 0 -840 z").attr({"stroke-width":"10px", "stroke":"#289784"});


    var stage = paper.path("M 300 0 l -300 200").attr({"stroke-width":"6px", "stroke":"#289784"});

    var stage_label = paper.text(120, 85, "Musik").attr(
        {"font-family":"arial",
            "font-size":"40",
            "text-align":"left",
            "fill":"#289784"}
    );
    stage_label.rotate(-34);

    var bar = paper.rect(740, 450, 60, 250).attr({"stroke-width":"6px","stroke":"#289784"});

    var bar_label = paper.text(770, 580, "Bar").attr(
        {"font-family":"arial",
            "font-size":"40",
            "text-align":"left",
            "fill":"#289784"}
    );
    bar_label.rotate(-90);


    var table1 = paper.rect(200, 80, 100, 100).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"});
    table1.rotate(-34);

    var table2 = paper.circle(470, 110, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"});

    var table3 = paper.rect(620, 30, 150, 200).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"});

    var table4 = paper.rect(620, 270, 150, 100).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"});

    var table5 = paper.rect(30, 260, 200, 150).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"});

    var table6 = paper.circle(130, 530, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"});

    var table7 = paper.rect(30, 650, 200, 150).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"});

    var table8 = paper.circle(150, 920, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"});

    var table9 = paper.rect(300, 870, 150, 200).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"});

    var table10 = paper.circle(580, 970, 80).attr({"stroke-width":"10px", "fill":"#289784", "stroke":"#289784"});

}

