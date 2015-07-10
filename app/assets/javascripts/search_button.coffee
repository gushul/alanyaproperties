duration = 400

navigationTween = (stage) ->
  if stage
    $(".last_td").css("width", 205).animate
      width: 84
    , duration, ->
      $(".search_input").hide()
      $(".search_item").show()

  else
    $(".search_input").show()
    $(".search_item").hide()
    $(".last_td").css("width", 84).animate
      width: 205
    , duration
    $("main-search-input").focus()

$ ->
  if $(".search_item").length
    $(".search_input").hide()
    navigationTween 0 if window.location.pathname.match(/^\/search/)
    $(".search_item").click ->
      navigationTween 0

    $("#main-search-input").blur ->
      navigationTween 1
