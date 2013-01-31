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

    var toggle_active = function(e) {
        var $elem = $(this);
        var user_id = $elem.parent().siblings(".user_id").html();
        var $active = $elem.parent().siblings(".active");

        $.ajax({
            url: 'users/' + user_id + '/activate',
            type: 'GET',
            success: function(data, textStatus, jqXHR) {
                var state = data["active"];
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

    pubInterface.init = function(){
        $(".toggle").click(toggle_active);
    }

    return pubInterface;

})();

$(users.init);