jQuery(document).ready(function () {
    function recalc() {
        var L, P, n, c, dp;
        L = parseInt($("#price").val().replace(/ /g, ''));
        n = parseInt($("#months").val()) * 12;
        f = parseInt($("#first").val());
        dp = 1 - f / L;
        L = L * dp;

        c = parseInt($("#percentage").val()) / 1200;
        /*
         *
         X=S*p/(1-(1+p)*1-m)

         Где X является суммой ежемесячного выплат по кредиту,
         S - сумма кредита,
         p - 1/12 годовой процентной ставки по кредиту, которая исходя из формулы выражается в сотых долях,
         m - срок выплат по кредиту в месяцах.
         */
        P = (L * (c * Math.pow(1 + c, n))) / (Math.pow(1 + c, n) - 1);

        if (!isNaN(P)) {
            $("#payment").val(P.toFixed(0));
        }
        else {
            $("#payment").val('error');
        }
    }
    if ($('#loan').length) {
        recalc();
        $("#first").keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
                (event.keyCode == 65 && event.ctrlKey === true) ||
                (event.keyCode >= 35 && event.keyCode <= 39)) {
                return;
            }
            else {
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });
        $("#months").keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
                (event.keyCode == 65 && event.ctrlKey === true) ||
                (event.keyCode >= 35 && event.keyCode <= 39)) {
                return;
            }
            else {
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });

        $("#percentage").keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
                (event.keyCode == 65 && event.ctrlKey === true) ||
                (event.keyCode >= 35 && event.keyCode <= 39)) {
                return;
            }
            else {
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });

        $("#loan input").keyup(function (event) {
            recalc();
        });
    }
    ;
    $(".curency .dropdown-menu a").click(function (e) {
        $.cookie('curency', $(this).text());
        location.reload();
    });
    if ($('#map').length > 0) {
        map = new GMaps({
            div: '#map',
            lat: 36.53939832332634,
            lng: 32.02735662460327,
            zoom: 14,
        });
        map.addMarker({
            lat: 36.53939832332634,
            lng: 32.02735662460327,
            title: 'RestProperty',
            click: function (e) {
                //alert('You clicked in this marker');
            }
        });
        /*

         if (GBrowserIsCompatible()) {
         var map = new GMap2(document.getElementById("map"));
         map.setCenter(new GLatLng(36.53939832332634,32.02735662460327), 14);
         map.addControl(new GSmallMapControl()); //k?? y? tu&#351;lar&#305; ve b??me k??tme kontrol?
         map.addControl(new GMapTypeControl());
         var marker = new GMarker(map.getCenter(), {draggable: false});
         map.addOverlay(marker);
         GEvent.addListener(marker, 'click', function() {
         marker.openInfoWindowHtml("RestProperty");
         });
         }*/
    }


    $('#callbackbtn').click(function () {
        var flag = true;
        if ($('#callbackform-name').val() === '') {
            $('#callbackform-name').addClass('error');
            flag = false;
        } else {
            $('#callbackform-name').removeClass('error');
        }
        if ($('#callbackform-tel').val() === '') {
            $('#callbackform-tel').addClass('error');
            flag = false;
        } else {
            $('#callbackform-tel').removeClass('error');
        }

        if (flag) {
            $(this).hide();
            $('.modal-footer').html("<img src='images/ajax.gif' height='12px' class='ajax_pre' id='ajax_pre' />");
            var tosend = $("#callbackform").serialize();
            var url = location.protocol + '//' + location.host + '/';
            /*
             $.post( url , tosend, function(data) {
             $('#callbackform').hide();
                $('#ajax_pre').hide();
                //$('.modal-footer').hide();
                $('#callbackalert').show();
             });
             */
            /*
             $.post( url , tosend, function(data) {
             $('#callbackform').hide();
             $('#ajax_pre').hide();
             //$('.modal-footer').hide();
             $('#callbackalert').show();
             });
             */
            $.ajax({
                type: "POST",
                beforeSend: function (request) {
                    request.setRequestHeader("x-ajax", "true");
                },
                url: url,
                data: tosend,
                processData: false,
                success: function (msg) {
                    $('#callbackform').hide();
                    $('#ajax_pre').hide();
                    $('#callbackalert').show();
                }
            });

        }

    });

});
