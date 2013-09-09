// Global settings for drawing the floor plan
var standard_stroke_color = "#289784";
var standard_stroke_width = "5px";

// Offsets for moving the drawn floor plans around the paper
var first_floor_x_offset = 0;
var first_floor_y_offset = 50;
var second_floor_x_offset = 430;
var second_floor_y_offset = 50;

window.onload = function () {

    $.getJSON(app_host + "/order_tickets_workflow/get_ball_tables",
        function(result){
            data_loaded_callback(result);
        }.bind(this)
    );
}

function data_loaded_callback(data) {

    var paper = new Raphael(document.getElementById('floor_plan'), 850, 1200);

    first_floor_drawables = create_first_floor_drawables(paper);
    second_floor_drawables = create_second_floor_drawables(paper);

    ball_tables = create_ball_tables(paper, data);
}

function create_ball_tables(paper, ball_table_data) {

    var ball_tables = [];

    var x_offset = 0;
    var y_offset = 0;

    for (var i = 0; i < ball_table_data.length; i++) {

        if(ball_table_data[i].floor == 1) {
            var x_offset = first_floor_x_offset;
            var y_offset = first_floor_y_offset;
        }
        else if(ball_table_data[i].floor == 2) {
            var x_offset = second_floor_x_offset;
            var y_offset = second_floor_y_offset;
        }
        var full_text = ball_table_data[i].caption + "\n(ausver-\nkauft)";
        var empty_text = ball_table_data[i].caption + "\n(Plätze frei)";
        var extra_text_offset = 0;
        if(ball_table_data[i].caption == "Tisch 4") {
            full_text = "T 4" + "\n(voll)";
            empty_text = "T 4" + "\n(frei)";
            extra_text_offset = -15;
        }
        if(ball_table_data[i].caption == "Tisch 19") {
            full_text = "T 19" + "\n(voll)";
            empty_text = "T 19" + "\n(frei)";
            extra_text_offset = -15;
        }
        if (ball_table_data[i].table_type == "rect") {
            var rect = paper.rect(x_offset + ball_table_data[i].position_x, y_offset + ball_table_data[i].position_y, ball_table_data[i].width, ball_table_data[i].height).attr({"stroke-width":standard_stroke_width, "fill":standard_stroke_color, "stroke":standard_stroke_color});
            if (ball_table_data[i].caption == "Tisch 4") {
                rect.rotate(-34);
            }
            rect.data({"id": ball_table_data[i].id});
            if(ball_table_data[i].get_number_of_available_seats <= 0) {
                var caption = paper.text(x_offset + ball_table_data[i].position_x + 30 + extra_text_offset, y_offset + ball_table_data[i].position_y + 30, full_text).attr(
                    {"font-family":"arial",
                        "font-weight":"700",
                        "font-size":"13",
                        "text-align":"center",
                        "fill":"#fff"}
                );
                caption.data({"id": ball_table_data[i].id});
                caption.click(empty_table_clicked);
                rect.click(empty_table_clicked);
            } else {
                var caption = paper.text(x_offset + ball_table_data[i].position_x + 38 + extra_text_offset, y_offset + ball_table_data[i].position_y + 20, empty_text).attr(
                    {"font-family":"arial",
                        "font-weight":"700",
                        "font-size":"13",
                        "text-align":"center",
                        "fill":"#fff"}
                );
                caption.data({"id": ball_table_data[i].id});
                caption.click(full_table_clicked);
            rect.click(full_table_clicked); }
            ball_tables.push(rect);
        } else if (ball_table_data[i].table_type == "circle") {

            var circle = paper.circle(x_offset + ball_table_data[i].position_x, y_offset + ball_table_data[i].position_y, ball_table_data[i].radius).attr({"stroke-width":standard_stroke_width, "fill":standard_stroke_color, "stroke":standard_stroke_color});
            circle.data({"id": ball_table_data[i].id});
            if(ball_table_data[i].get_number_of_available_seats <= 0) {
                var caption = paper.text(x_offset + ball_table_data[i].position_x, y_offset + ball_table_data[i].position_y, full_text).attr(
                    {"font-family":"arial",
                        "font-weight":"700",
                        "font-size":"13",
                        "text-align":"center",
                        "fill":"#fff"}
                );
                caption.data({"id": ball_table_data[i].id});
                caption.click(empty_table_clicked);
                circle.click(empty_table_clicked);
            } else {
                var caption = paper.text(x_offset + ball_table_data[i].position_x, y_offset + ball_table_data[i].position_y, empty_text).attr(
                    {"font-family":"arial",
                        "font-weight":"700",
                        "font-size":"13",
                        "text-align":"center",
                        "fill":"#fff"}
                );
                caption.data({"id": ball_table_data[i].id});
                caption.click(full_table_clicked);
                circle.click(full_table_clicked); }
        }
    }

    return ball_tables;
}

empty_table_clicked = function () {

    alert("Dieser Tisch ist ausverkauft. Bitte wählen Sie einen anderen Tisch.");
}

full_table_clicked = function () {
    window.location = app_host + "/order_tickets_workflow/receive_selected_table?selected_table_id=" + this.data("id");
}

function create_first_floor_drawables(paper) {

    var first_floor_drawables = [];

    var x_offset = first_floor_x_offset;
    var y_offset = first_floor_y_offset;

    // Label
    first_floor_drawables.push(paper.text(x_offset + 200, y_offset - 25, "Erdgeschoss").attr(
        {"font-family":"arial",
            "font-weight":"900",
            "font-size":"25",
            "text-align":"left",
            "fill":standard_stroke_color}
    ));


    // Background
    first_floor_drawables.push(paper.rect(x_offset + 0, y_offset + 0, 400, 550).attr({"fill":"white", "stroke": "white", "stroke-width":"0"}));

    // Outline
    first_floor_drawables.push(paper.path("M " + (x_offset + 100) + " " + (y_offset + 0) + " l 300 0 l 0 550 l -300 0 l -100 -65 l 0 -420 z").attr({"stroke-width":"6px", "stroke":standard_stroke_color}));

    // Stage
    first_floor_drawables.push(paper.path("M " + (x_offset + 150) + " " + (y_offset + 0) + " 0 l -150 100").attr({"stroke-width":standard_stroke_width, "stroke":standard_stroke_color}));

    // Stage label
    first_floor_drawables.push(paper.text(x_offset + 60, y_offset + 42, "Musik").attr(
        {"font-family":"arial",
            "font-size":"22",
            "text-align":"left",
            "fill":standard_stroke_color}
    ).rotate(-34));

    // Bar
    first_floor_drawables.push(paper.rect(x_offset + 370, y_offset + 225, 30, 125).attr({"stroke-width":standard_stroke_width,"stroke":standard_stroke_color}));

    // Bar label
    first_floor_drawables.push(paper.text(x_offset + 385, y_offset + 290, "Bar").attr(
        {"font-family":"arial",
            "font-size":"25",
            "text-align":"left",
            "fill":standard_stroke_color}
    ).rotate(-90));

    return first_floor_drawables;
}

function create_second_floor_drawables(paper) {

    var second_floor_drawables = [];

    var x_offset = second_floor_x_offset;
    var y_offset = second_floor_y_offset;

    // Label
    second_floor_drawables.push(paper.text(x_offset + 200, y_offset -25, "Obergeschoss").attr(
        {"font-family":"arial",
            "font-weight":"900",
            "font-size":"25",
            "text-align":"left",
            "fill":standard_stroke_color}
    ));

    // Background
    second_floor_drawables.push(paper.rect(x_offset + 0, y_offset + 0, 400, 550).attr({"fill":"white", "stroke": "white", "stroke-width":"0"}));

    // Outline
    second_floor_drawables.push(paper.path("M " + (x_offset + 100) + " " + (y_offset + 0) + " l 300 0 l 0 550 l -300 0 l -100 -65 l 0 -420 z").attr({"stroke-width":"6px", "stroke":standard_stroke_color}));

    // Bar
    second_floor_drawables.push(paper.rect(x_offset + 215, y_offset + 360, 185, 30).attr({"stroke-width":standard_stroke_width,"stroke":standard_stroke_color}));

    // Bar label
    second_floor_drawables.push(paper.text(x_offset + 305, y_offset + 375, "Bar").attr(
        {"font-family":"arial",

            "font-size":"25",
            "text-align":"left",
            "fill":standard_stroke_color}
    ));

    return second_floor_drawables;
}





