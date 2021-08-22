(function ($) {
    "use strict";
    $(".toggle-password").click(function () {
        $(this).toggleClass("fa-eye fa-eye-slash");
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });

    /*login 버튼 클릭*/
    $('#login').on('click', function () {
        var userid = $('#userid').val();
        var password = $('#password').val();

        $.ajax({
            type: 'GET',
            url: '/client/login-process',
            cache: false,
            datatype: 'json',
            data: {'userid': userid, 'password': password},
            success: function(data) {
                console.log('data', data);
                // alert(data.msg);
                if (data.result === true) {
                    location.href = '/client/menu';
                }
            },
            error: function(e) {
                console.log(e.status, e.error);
                alert(e);
            },
            complete : function() {
                // $('#userid').on('cursor', function() {
                // });
            }
        });
    })
})(jQuery);
