scrollToTop = ->
  verticalOffset = (if typeof (verticalOffset) isnt "undefined" then verticalOffset else 0)
  element = $("body")
  offset = element.offset()
  offsetTop = offset.top
  $("html, body").animate
    scrollTop: offsetTop
  , 500, "linear"
  return
$ ->
  $(document).on "scroll", ->
    if $(window).scrollTop() > 100
      $(".scroll-top-wrapper").addClass "show"
    else
      $(".scroll-top-wrapper").removeClass "show"
    return

  $(".scroll-top-wrapper").on "click", scrollToTop
  return

$ ->
  $(document).on "scroll", ->
    if $(window).scrollTop() > 100
      $(".scroll-top-wrapper").addClass "show"
    else
      $(".scroll-top-wrapper").removeClass "show"
    return

  return


