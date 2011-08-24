users = (function() {
    var pubInterface = {};

    $.ajaxSetup({
        async: true,
//        timeout: 2000,
        dataType: 'json',
        global: true,
        beforeSend: function() {
            $("#ajax_response").html("");
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert("ajax error: " + errorThrown + ",     status code: " + jqXHR.status);
        }
    });

    pubInterface.toggle_active = function(elem) {
        var $elem = $(elem);
        var user_id = $elem.parent().siblings(".user_id").html();
        var $active = $elem.parent().siblings(".active");

        $.ajax({
            url: 'users/' + user_id + '/activate',
            type: 'GET',
            success: function(data, textStatus, jqXHR) {
                var state = data["user"]  ?  data["user"]["active"]  :  (data["buyer"]  ?  data["buyer"]["active"]  :  (data["seller"]["active"]));
                if (state) {
                    $active.html("true");
                    $elem.html("Inactivate");
                } else {
                    $active.html("false");
                    $elem.html("Activate");
                }
            }
        });
    };

    return pubInterface;

})();