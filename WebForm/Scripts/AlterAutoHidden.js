﻿
$(document).ready(function () {

    window.setTimeout(function () {
        $(".alert").fadeTo(2500, 0).slideUp(500, function () {
            $(this).remove();
        });
    }, 2000);

});
