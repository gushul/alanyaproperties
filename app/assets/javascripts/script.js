var duration = 400;
var visible_popup = '';
var browser_class;
var document_scroll;

function setBrowserClassToBody() {
    $.each(jQuery.browser, function (i, val) {
        if (i == 'msie') return false;
        browser_class = i;
        return false;
    });

    // for IE we use conditional comments in html
    $('html').addClass(browser_class);
    /* mozilla, webkit, opera, ie_7, ie_8 */
}

function trim(string) {
    return string.replace(/(^\s+)|(\s+$)/g, "");
}

function setAutoRemove(element, def_val) {
    if (!$(element)) return false;

    $(element).focus(function () {
        if ($(this).val() == def_val) {
            $(this).val('');
            $(element).removeClass('default');
        }
    });
    $(element).blur(function () {
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

function initPopup(popup) {
    var close = popup.find('.close');
    close.click(hidePopup);
    $('#back').hide().removeClass('none').click(hidePopup);

    popup.hide();

    if (visible_popup.length) {
        showPopup($('.' + visible_popup));
    }
}
function hidePopup() {
    $('#back').fadeOut();
    if ($('#popup-video').length) jwplayer().stop()
    $('.popup.act').fadeOut(duration, function () {
        $('.popup_table').addClass('hide');
        $('.popup.act').removeClass('act');
        $('.wrapper').removeClass('wrapper_popup').css('top', 'auto');
        $('body').removeClass('body_scroll');
        $(window).scrollTop(document_scroll);
    });
}
function showPopup(popup) {

    if ($(popup).hasClass('act')) return false;

    if ($('.popup_table').hasClass('hide')) {
        // no visible popup
        document_scroll = $(window).scrollTop();
        $('body').addClass('body_scroll');
        $('.wrapper').addClass('wrapper_popup');
        $('.wrapper').css('top', -document_scroll);
        $('.popup_table').removeClass('hide');
        $(popup).fadeIn(duration);
        $('#back').fadeIn(duration);
    } else {
        // we have active popup
        $('.popup.act').fadeOut(duration, function () {
            $(popup).fadeIn(duration);
        });
        $('.popup.act').removeClass('act');
    }

    $(popup).addClass('act');

}

function initSelect(select) {
    var sel_input = select.find('input');
    var sel_val = select.find('.sel_val span');
    var sel_optn = select.find('.sel_optn');

    select.bind('click', function (evt) {
        if ($(evt.target).hasClass('sel_optn')) {
            sel_val.text($(evt.target).text());
            sel_input.val($(evt.target).attr('rel'));
        }

        if ($(this).hasClass('act')) $(this).removeClass('act')
        else $(this).addClass('act')
    });
}

function initMainSlider() {
    var active = 0;
    var slider = $('#main-slider');
    var ar_l = slider.find('.arrow.left');
    var ar_r = slider.find('.arrow.right');
    var toggles = slider.find('.toggle');
    var items = slider.find('.item');
    var item_width = $(items[0]).outerWidth();

    toggles.removeClass('act');
    $(toggles[active]).addClass('act');

    items.each(function (index, item) {
        if (active == index) {
            $(item).animate({width: item_width}, 0);
            $(item).find('.item_info').show();
            $(item).addClass('act');
        }
        else {
            $(item).animate({width: 0}, 0);
            $(item).find('.item_info').hide();
        }
    });

    if (items.length <= 1) {
        ar_l.remove();
        ar_r.remove();
        toggles.remove();
        return false;
    }

    var sliderEvent = function () {
        if ($(this).hasClass('act')) return false;

        removeSliderEvents();

        var next = 0;
        if ($(this).hasClass('toggle')) {
            next = toggles.index(this);
        } else if ($(this).hasClass('left')) {
            next = (active - 1 < 0) ? items.length - 1 : active - 1;
        } else {
            next = (active + 1 > items.length - 1) ? 0 : active + 1;
        }

        $(items[active]).find('.item_info').fadeOut(duration, function () {
            $(items[active]).animate({width: 0}, duration, function () {
                $(items).removeClass('act');
                $(items[active]).addClass('act');
                $(items[active]).find('.item_info').fadeIn(duration, addSliderEvents);
            });
            active = next;
            toggles.removeClass('act');
            $(toggles[active]).addClass('act');
            $(items[active]).animate({width: item_width}, 0);
        });
    };

    var addSliderEvents = function () {
        ar_l.bind('click', sliderEvent);
        ar_r.bind('click', sliderEvent);
        toggles.bind('click', sliderEvent);
    };
    var removeSliderEvents = function () {
        ar_l.unbind('click', sliderEvent);
        ar_r.unbind('click', sliderEvent);
        toggles.unbind('click', sliderEvent);
    };

    addSliderEvents();
}

function navigationTween(stage) {
    if (stage) {
        // show Поиск
        $('.last_td').css('width', 205).animate({width: 84}, duration, function () {
            $('.search_input').hide();
            $('.search_item').show();
        });
    } else {
        // show input
        $('.search_input').show();
        $('.search_item').hide();
        $('.last_td').css('width', 84).animate({width: 205}, duration);
        document.getElementById('main-search-input').focus();
    }
}


$(document).ready(function () {
    // set class to body
    // setBrowserClassToBody();

    // init popups
    if ($('.popup').length) {
        $('.popup').each(function (index, item) {
            initPopup($(item));
        });
    }

    // filter_label add click event, if inner input[type=checkbox] checked add class act to label
    $('.label_checkbox').on('click', function (e) {
        // e.stopPropagation();
        // e.preventDefault();
        $('input', this).prop('checked') ? $(this).addClass('act') : $(this).removeClass('act');
    })

    if ($('.label_radio').length) {
        $('.label_radio').click(function () {
            $('.label_radio').removeClass('act');
            $(this).addClass('act');
        });
    }

    // selects
    if ($('.select').length) {
        $('.select').each(function (index, item) {
            initSelect($(item));
        })
    }

    // main slider
    if ($('#main-slider').length) {
        initMainSlider();
    }

    if ($('.search_item').length) {
        $('.search_input').hide();
        $('.search_item').click(function () {
            navigationTween(0)
        })
        $('#main-search-input').blur(function () {
            navigationTween(1)
        })
    }
});
