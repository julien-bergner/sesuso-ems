window.onload = function () {

    setup_amount_fields(start_amount);

    $('#plus-button').click(function (e) {
        e.preventDefault();
        var old_amount = parseInt($('#amount-field').text());
        var new_amount;
        if (old_amount >= max_available_amount) {
            new_amount = max_available_amount;
        }
        else {
            new_amount = old_amount + 1;
        }
        write_new_amount(new_amount);
    });

    $('#minus-button').click(function (e) {
        e.preventDefault();
        var old_amount = parseInt($('#amount-field').text());
        var new_amount;
        if(old_amount == 1) {
            new_amount = 1;
        }
        else {
            new_amount = old_amount - 1;
        }
        write_new_amount(new_amount);
    });
}

function setup_amount_fields(start_amount) {
    write_new_amount(start_amount);
}

function write_new_amount(new_amount) {
    $('#amount-field').text(new_amount.toString());
    $('#selected_amount_of_seats').attr("value", new_amount.toString());
}
