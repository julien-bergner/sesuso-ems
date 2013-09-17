// Global settings for drawing the floor plan
var standard_stroke_color = "#289784";
var standard_stroke_width = "5px";

// Offsets for moving the drawn floor plans around the paper
var first_floor_x_offset = 0;
var first_floor_y_offset = 50;
var second_floor_x_offset = 430;
var second_floor_y_offset = 50;

// Standard texts
var standard_full_text =  "\n(ausver-\nkauft)";
var standard_empty_text = "\n(Plätze frei)";

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

        var form = make_table(paper, ball_table_data[i], x_offset, y_offset);
        var caption = make_label(paper, form, ball_table_data[i]);
    }

    return ball_tables;
}

function make_table(paper, ball_table_data_set, x_offset,y_offset) {
    if (ball_table_data_set.table_type == "rect") {
        var form = paper.rect(x_offset + ball_table_data_set.position_x, y_offset + ball_table_data_set.position_y,
            ball_table_data_set.width, ball_table_data_set.height);
        if (ball_table_data_set.caption == "Tisch 4") {
            form.rotate(-34);
        }
        form.data({"id": ball_table_data_set.id});

    } else if (ball_table_data_set.table_type == "circle") {

        var form = paper.circle(x_offset + ball_table_data_set.position_x, y_offset + ball_table_data_set.position_y,
            ball_table_data_set.radius);
        form.data({"id": ball_table_data_set.id});

    }


    if (ball_table_data_set.get_number_of_available_seats > 0) {
        form.attr({"stroke-width":standard_stroke_width,
            "fill":standard_stroke_color, "stroke":standard_stroke_color});
    } else {
        form.attr({"stroke-width":standard_stroke_width,
            "fill": "#fff", "stroke":standard_stroke_color});
    }
    return form;
}

function make_label(paper, form, ball_table_data_set) {

    if(ball_table_data_set.caption == "Tisch 4") {
        var base_text  = "Tisch\n4 ";
        var empty_text =  "(frei)";
        var full_text = "\n(voll)";
     } else if(ball_table_data_set.caption == "Tisch 19") {
        var base_text  = "Tisch\n19";
        var empty_text =  "\n(frei)";
        var full_text = "\n(voll)";
    } else {
        var base_text  = ball_table_data_set.caption;
        var empty_text = "\n(" + ball_table_data_set.get_number_of_available_seats + " Plätze\nfrei)";
        var full_text = standard_full_text;
    }

    if (ball_table_data_set.get_number_of_available_seats > 0) {

        var caption = get_new_label(paper, get_center_x(form), get_center_y(form), base_text + empty_text,
            ball_table_data_set.id, "#fff", empty_click_function);
        form.click(empty_click_function);
    } else {
        var caption = get_new_label(paper, get_center_x(form), get_center_y(form), base_text + full_text,
            ball_table_data_set.id, standard_stroke_color, full_click_function);
        form.click(full_click_function);
    }
    return caption;
}

function get_new_label(paper, x_position, y_position, text, id, color, click_function) {
    var caption = paper.text(x_position, y_position, text).attr(
        {"font-family":"arial",
            "font-weight":"700",
            "font-size":"13",
            "text-align":"center",
            "fill": color}
    );
    caption.data({"id": id});
    caption.click(click_function);
    return caption;
}

function get_center_x(form) {
    if (form.type == "circle") {
        return form.attr('cx');
    } else if (form.type == "rect") {
        return (form.attr('x') + (form.attr('width') / 2));
    }
}

function get_center_y(form) {
    if (form.type == "circle") {
        return form.attr('cy');
    } else if (form.type == "rect") {
        return (form.attr('y') + (form.attr('height') / 2));
    }
}

full_click_function = function () {

    alert("Dieser Tisch ist ausverkauft. Bitte wählen Sie einen anderen Tisch.");
}

empty_click_function = function () {
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





