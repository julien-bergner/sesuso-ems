window.onload = function () {

    $(".plus-button").click(function (e) {
        e.preventDefault();
        var id = $(this).attr('id');

        var old_amount = parseInt($("#amount-field-" + id).text());
        var new_amount;
        if (old_amount >= max_available_amount) {
            new_amount = max_available_amount;
        }
        else {
            new_amount = old_amount + 1;
        }
        write_new_amount(new_amount, id);
    });

    $('.minus-button').click(function (e) {
        e.preventDefault();
        var id = $(this).attr('id');

        var old_amount = parseInt($("#amount-field-" + id).text());
        var new_amount;
        if (old_amount == 0) {
            new_amount = 0;
        }
        else {
            new_amount = old_amount - 1;
        }
        write_new_amount(new_amount, id);
    });
}

function write_new_amount(new_amount, id) {
    $("#amount-field-" + id).text(new_amount.toString());
    $("#input-amount-" + id).attr("value", new_amount.toString());
}
