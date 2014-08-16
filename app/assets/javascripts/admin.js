//= require jquery
//= require jquery.ui.sortable
//= require jquery_ujs
//= require twitter/bootstrap
//= require redactor-rails/config
//= require redactor-rails
//= require redactor-rails/langs/ru
//= require jquery.dataTables.min
//= require jquery-fileupload/basic
//= require bootstrap-datetimepicker/bootstrap-datetimepicker
//= require bootstrap-datetimepicker/bootstrap-datetimepicker_ru
//= require DT_bootstrap
//= require_tree ./admin

$(function () {
    initDataTable('.data-table')
    // $('#property_description').wysihtml5({
    // "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
    // "emphasis": true, //Italics, bold, etc. Default true
    // "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
    // "html": true, //Button which allows you to edit the generated HTML. Default false
    // "link": true, //Button to insert a link. Default true
    // "image": true, //Button to insert an image. Default true,
    // "color": false //Button to change color of font  
    // });
    $('.sortable').sortable({
        axis: 'y',
        items: 'tbody > tr',
        update: function () {
            $.post($(this).data('sort-url'), $(this).sortable('serialize'))
        }
    })

    $('.new_photo').fileupload({
        dataType: 'script'
    });

    // $('.redactor2').redactor({convertDivs: false});
})
