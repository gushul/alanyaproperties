//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require jquery.ui.datepicker-ru
//= require jquery.ui.tooltip
// require jquery-ui-1.9.2.custom.min
//= require wiselinks
//= require modernizr
//= require script
//= require period
//= require transfer
//= require jquery.colorbox-min
//= require jquery.expander
//= require to_top
//= require search_button

$(function () {
  window.wiselinks = new Wiselinks($('body'), {html4: false});

  $('.property_photo').colorbox({rel: 'property', maxWidth: '80%', maxHeight: '90%', className: 'property_box'});
  $('.property_video').colorbox({rel: 'property', innerWidth:500, innerHeight:409, className: 'property_box', iframe: true});
  $('.property_map').colorbox({iframe: true, width: '80%', height: '90%', className: 'property_box'});
  $('.send_offer').colorbox({iframe: true, width: '490px', height: '516px', close: 'Закрыть окно', fastIframe: false});
  $('.main_slider .video').colorbox({iframe:true, innerWidth:500, innerHeight:409});

  $('.live-form').change(function(e){
    // Wiselinks load
    // var url = $(this).attr('action') + '?' + $(this).serialize();
    // console.log(url)
    // wiselinks.load(url, "#live", 'partial')
    // Precompilation assets hook


    setTimeout(function(){ $('.live-form').submit(); });
  });

  $('div.expander').expander({
    slicePoint: 510,
    expandText: 'Читать далее',
    // expandPrefix: '. ',
    userCollapseText: 'свернуть..'
  });

  $('.has-tooltip').tooltip({
    track: true,
    position: {
      my: "center top+20",
      at: "center bottom",
      using: function( position, feedback ) {
        $( this ).css( position );
        $( "<div>" )
        .addClass( "arrow" )
        .addClass( feedback.vertical )
        .addClass( feedback.horizontal )
        .appendTo( this );
      }
    }
  });
});
