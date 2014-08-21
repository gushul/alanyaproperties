$ -> new SortablePhotos

class SortablePhotos
  ids: []
  current_ids: []
  el: '#sortable-photos'
  button: $('#js-post-photos-position')

  constructor: ->
    @el = $(@el)
    @button = $(@button)
    @el.sortable
      cursor: 'move'
      update: @dropEvent
    @el.disableSelection()
    @setIds()
    @button.on 'click', @submitAction

  dropEvent: =>
    @getIds()
    is_changed =  @current_ids.toString() != @ids.toString()
    if is_changed
      @button.removeClass('hidden')
             .hide()
             .fadeIn()
    else
      @button.fadeOut()

  setIds: ->
    @ids = @el.sortable 'toArray'

  getIds: ->
    @current_ids = @el.sortable 'toArray'

  submitAction: =>
    console.log @current_ids
    $.ajax
      type: "POST"
      dataType: 'json'
      url: "#{window.location.pathname}/sort"
      data:
        current_ids: (@current_ids)
      success: (data, status) =>
        @button.fadeOut()
        @ids = []
        @setIds()
        alert('Позиции успешно обновлены')
      error: (data, status) =>
        alert("Ошибка: #{data.statusText} ")


