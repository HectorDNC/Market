$(document).ready(function() {

    $('.logout').on('click', function(e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: GLOBAL.URL+"login/logout",
            cache: false,
            contentType: false,
            processData: false,
            success: function(response) {
                console.log(response);

                window.location = GLOBAL.URL;
                

            },
            error: (response) => {
                console.log(response);

            }
        });
    });



});