var duration = 400;
var visible_popup = '';
var browser_class;
var document_scroll;

function setBrowserClassToBody(){
    $.each(jQuery.browser, function(i, val) {
        if( i == 'msie' ) return false;
        browser_class = i;
        return false;
    });

    // for IE we use conditional comments in html
    $('html').addClass(browser_class);
    /* mozilla, webkit, opera, ie_7, ie_8 */
}

function trim(string){
    return string.replace(/(^\s+)|(\s+$)/g, "");
}

function setAutoRemove( element, def_val ) {
    if (!$(element)) return false;

    $(element).focus(function() {
        if ($(this).val() == def_val) {
            $(this).val('');
            $(element).removeClass('default');
        }
    });
    $(element).blur(function() {
        if (trim($(this).val()) == '') {
            $(this).val(def_val);
            $(element).addClass('default');
        }
    });
    if ($(element).val() == '') {
        $(element).val(def_val);
        $(element).addClass('default');
    }
    return $(element);
}

function initPopup(popup){
    var close       = popup.find('.close');
    close.click(hidePopup);
    $('#back').hide().removeClass('none').click(hidePopup);

    popup.hide();

    if( visible_popup.length ){
        showPopup($('.'+visible_popup));
    }
}
function hidePopup(){
    $('#back').fadeOut();
    if( $('#popup-video').length ) jwplayer().stop()
    $('.popup.act').fadeOut(duration, function(){
        $('.popup_table').addClass('hide');
        $('.popup.act').removeClass('act');
        $('.wrapper').removeClass('wrapper_popup').css('top','auto');
        $('body').removeClass('body_scroll');
        $(window).scrollTop(document_scroll);
    });
}
function showPopup(popup){

    if ( $(popup).hasClass('act') ) return false;

    if( $('.popup_table').hasClass('hide') ){
        // no visible popup
        document_scroll = $(window).scrollTop();
        $('body').addClass('body_scroll');
        $('.wrapper').addClass('wrapper_popup');
        $('.wrapper').css('top',-document_scroll);
        $('.popup_table').removeClass('hide');
        $(popup).fadeIn(duration);
        $('#back').fadeIn(duration);
    } else {
        // we have active popup
        $('.popup.act').fadeOut(duration, function(){
            $(popup).fadeIn(duration);
        });
        $('.popup.act').removeClass('act');
    }

    $(popup).addClass('act');

}

function filterLabelRadio(labels){
    var name = $(labels[0]).attr('name');
    labels.click(function(){
//        $(this).addClass('act')
//        else
    });
}


$(document).ready(function() {
    // set class to body
    setBrowserClassToBody();

    // init popups
    if( $('.popup').length ){
        $('.popup').each(function(index, item){
            initPopup($(item));
        });
    }

    // filter_label add click event, if inner input[type=checkbox] checked add class act to label
    if( $('.label_checkbox').length ){

        $('.label_checkbox').click(function(){
            if( $(this).find('input').attr('checked') == 'checked') $(this).addClass('act')
            else $(this).removeClass('act')
        });
    }

    if( $('.label_radio').length ){
        $('.label_radio').click(function(){
            var name = $(this).find('input').attr('name');
            $('input[name='+name+']').closest('.label_radio').removeClass('act');
            $(this).addClass('act');
        });
    }

    // datepickers
    if( $('#date-start').length ){
        $('#date-start-datepicker').datepicker({
            altField: "#date-start",
            dateFormat: "dd-mm-yy"
            ,showOtherMonths: true
            ,selectOtherMonths: true
        });
        $('#date-end-datepicker').datepicker({
            altField: "#date-end",
            dateFormat: "dd-mm-yy"
            ,showOtherMonths: true
            ,selectOtherMonths: true
        });

        $('#date-end-datepicker').addClass('none');
        $('#date-end').bind({
            focus:function(){
                $('#date-end-datepicker').removeClass('none');
                $('#date-start-datepicker').addClass('none');
            }
        })
        $('#date-start').bind({
            focus:function(){
                $('#date-start-datepicker').removeClass('none');
                $('#date-end-datepicker').addClass('none');
            }
        })
    }
});