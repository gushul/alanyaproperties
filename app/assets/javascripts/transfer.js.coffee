$ ->
  return unless $('.transfer_form').length

  $('.date-input').datepicker
    showOtherMonths: true,
    selectOtherMonths: true
  
  console.log "Transfer script init"
  transfer_radio_labels = $('.transfer_form .transfer_plane.label_radio')
  transfer_radio_labels.off('click')

  transfer_radio_labels.on 'click', ->
    transfer_radio_labels.removeClass('act').parent().addClass('disabled')
    $(this).addClass('act').parent().removeClass('disabled')
    # Enable submit
    submit_on()

  $('.transfer_form .transfer_clmn').on 'focus click', 'input', ->
    console.log "On Focus"
    console.log $(this).parents('.transfer_plane.label_radio')
    $(this).closest('.transfer_clmn').find('.transfer_plane.label_radio').click()
    $('.transfer_form .transfer_clmn').off 'focus click', 'input'

  $('.transfer_form .transfer_in .terminal.label_radio').off 'click'
  $('.transfer_form .transfer_out .terminal.label_radio').off 'click'

  $('.transfer_form .transfer_in .terminal.label_radio').on 'click', ->
    $('.transfer_form .transfer_in .terminal.label_radio').removeClass 'act'
    $(this).addClass 'act'

  $('.transfer_form .transfer_out .terminal.label_radio').on 'click', ->
    $('.transfer_form .transfer_out .terminal.label_radio').removeClass 'act'
    $(this).addClass 'act'

  submit_on = ->
    $('.transfer_form .btn').removeClass('disabled')
    $('.transfer_form .btn input[type=submit]').attr('disabled', false)

