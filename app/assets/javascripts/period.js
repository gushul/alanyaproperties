$(function () {
    // datepickers
    if (!$('.filter_section.period').length) return;
    $.datepicker.setDefaults($.datepicker.regional[ "ru" ]);
    // NEW
    $('#date-start').datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        beforeShow: function (input, inst) {
            console.log(input, inst);
            $('#datepicker-inner').html(inst.dpDiv);
            $('#date-start-label, #date-start.date').addClass('act')
        },
        onClose: function () {
            $('#date-start-label, #date-start.date').removeClass('act')
        }
    });

    $('#date-end').datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        beforeShow: function (input, inst) {
            console.log(input, inst);
            $('#datepicker-inner').html(inst.dpDiv);
            $('#date-end-label, #date-end.date').addClass('act')
        },
        onClose: function () {
            $('#date-end-label, #date-end.date').removeClass('act')
        }
    });

    $('.filter_section.period label').unbind('click')
    $('.filter_section.period label#date-start-label').click(function (e) {
        $('#date-end').datepicker('hide');
        $('#date-start').datepicker('show');
    });
    $('.filter_section.period label#date-end-label').click(function (e) {
        $('#date-start').datepicker('hide');
        $('#date-end').datepicker('show');
    });


    return;
    // OLD
    /* 
     var datepicker_active = false;
     var current_period = null;

     $('.filter_section.period label').unbind('click');

     $('.filter_section.period label').on('click', function(e){
     period = $(e.target).data('el');
     if(!period) return;

     console.log(period, current_period);
     // current_period = period;
     datepicker_inner = $('#datepicker-inner');

     if(current_period == period){
     datepicker_inner.slideUp(function(){
     datepicker_inner.datepicker('destroy');
     });
     current_period = null;
     datepicker_active = false;
     $('.filter_section.period label').removeClass('act');
     return;
     }else{
     datepicker_inner.datepicker('destroy')
     $('.filter_section.period label').removeClass('act');
     }

     // $('#datepicker-inner').datepicker('destroy');
     console.log('setup datepicker');
     datepicker_inner.datepicker({
     altField: '#' + period,
     // dateFormat: "mm/dd/yy",
     showOtherMonths: true,
     selectOtherMonths: true
     });

     if(!datepicker_active){ datepicker_inner.slideToggle() }
     $(e.target).addClass('act');

     datepicker_active = true;
     current_period = period;

     }); */
})
