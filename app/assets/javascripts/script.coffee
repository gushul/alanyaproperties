setBrowserClassToBody = ->
  $.each jQuery.browser, (i, val) ->
    return false  if i is "msie"
    browser_class = i
    false


  # for IE we use conditional comments in html
  $("html").addClass browser_class
  return

# mozilla, webkit, opera, ie_7, ie_8 
trim = (string) ->
  string.replace /(^\s+)|(\s+$)/g, ""

setAutoRemove = (element, def_val) ->
  return false  unless $(element)
  $(element).focus ->
    if $(this).val() is def_val
      $(this).val ""
      $(element).removeClass "default"
    return

  $(element).blur ->
    if trim($(this).val()) is ""
      $(this).val def_val
      $(element).addClass "default"
    return

  if $(element).val() is ""
    $(element).val def_val
    $(element).addClass "default"
  $ element

initPopup = (popup) ->
  close = popup.find(".close")
  close.click hidePopup
  $("#back").hide().removeClass("none").click hidePopup
  popup.hide()
  showPopup $("." + visible_popup)  if visible_popup.length
  return

hidePopup = ->
  $("#back").fadeOut()
  jwplayer().stop()  if $("#popup-video").length
  $(".popup.act").fadeOut duration, ->
    $(".popup_table").addClass "hide"
    $(".popup.act").removeClass "act"
    $(".wrapper").removeClass("wrapper_popup").css "top", "auto"
    $("body").removeClass "body_scroll"
    $(window).scrollTop document_scroll
    return

  return

showPopup = (popup) ->
  return false  if $(popup).hasClass("act")
  if $(".popup_table").hasClass("hide")

    # no visible popup
    document_scroll = $(window).scrollTop()
    $("body").addClass "body_scroll"
    $(".wrapper").addClass "wrapper_popup"
    $(".wrapper").css "top", -document_scroll
    $(".popup_table").removeClass "hide"
    $(popup).fadeIn duration
    $("#back").fadeIn duration
  else

    # we have active popup
    $(".popup.act").fadeOut duration, ->
      $(popup).fadeIn duration
      return

    $(".popup.act").removeClass "act"
  $(popup).addClass "act"
  return

initSelect = (select) ->
  sel_input = select.find("input")
  sel_val = select.find(".sel_val span")
  sel_optn = select.find(".sel_optn")
  select.bind "click", (evt) ->
    if $(evt.target).hasClass("sel_optn")
      sel_val.text $(evt.target).text()
      sel_input.val $(evt.target).attr("rel")
    if $(this).hasClass("act")
      $(this).removeClass "act"
    else
      $(this).addClass "act"
    return

  return

initMainSlider = ->
  active = 0
  slider = $("#main-slider")
  ar_l = slider.find(".arrow.left")
  ar_r = slider.find(".arrow.right")
  toggles = slider.find(".toggle")
  items = slider.find(".item")
  item_width = $(items[0]).outerWidth()
  toggles.removeClass "act"
  $(toggles[active]).addClass "act"
  items.each (index, item) ->
    if active is index
      $(item).animate
        width: item_width
      , 0
      $(item).find(".item_info").show()
      $(item).addClass "act"
    else
      $(item).animate
        width: 0
      , 0
      $(item).find(".item_info").hide()
    return

  if items.length <= 1
    ar_l.remove()
    ar_r.remove()
    toggles.remove()
    return false
  sliderEvent = ->
    return false  if $(this).hasClass("act")
    removeSliderEvents()
    next = 0
    if $(this).hasClass("toggle")
      next = toggles.index(this)
    else if $(this).hasClass("left")
      next = (if (active - 1 < 0) then items.length - 1 else active - 1)
    else
      next = (if (active + 1 > items.length - 1) then 0 else active + 1)
    $(items[active]).find(".item_info").fadeOut duration, ->
      $(items[active]).animate
        width: 0
      , duration, ->
        $(items).removeClass "act"
        $(items[active]).addClass "act"
        $(items[active]).find(".item_info").fadeIn duration, addSliderEvents
        return

      active = next
      toggles.removeClass "act"
      $(toggles[active]).addClass "act"
      $(items[active]).animate
        width: item_width
      , 0
      return

    return

  addSliderEvents = ->
    ar_l.bind "click", sliderEvent
    ar_r.bind "click", sliderEvent
    toggles.bind "click", sliderEvent
    return

  removeSliderEvents = ->
    ar_l.unbind "click", sliderEvent
    ar_r.unbind "click", sliderEvent
    toggles.unbind "click", sliderEvent
    return

  addSliderEvents()

  setInterval(sliderEvent, 4000)

  return


duration = 400
visible_popup = ""
browser_class = undefined
document_scroll = undefined

$(document).ready ->

  # set class to body
  # setBrowserClassToBody();

  # init popups
  if $(".popup").length
    $(".popup").each (index, item) ->
      initPopup $(item)
      return


  # filter_label add click event, if inner input[type=checkbox] checked add class act to label
  $(".label_checkbox").on "click", (e) ->

    # e.stopPropagation();
    # e.preventDefault();
    (if $("input", this).prop("checked") then $(this).addClass("act") else $(this).removeClass("act"))
    return

  if $(".label_radio").length
    $(".label_radio").click ->
      $(".label_radio").removeClass "act"
      $(this).addClass "act"
      return


  # selects
  if $(".select").length
    $(".select").each (index, item) ->
      initSelect $(item)
      return


  # main slider
  initMainSlider()  if $("#main-slider").length

  return
