$ -> new ModalWindow

class ModalWindow
  constructor: ->
    if modalOnLeave?
      ouibounce $('#blank')[0],
        callback: => @appendModal()

    if modalTimeout?
      setTimeout(@appendModal, modalTimeout)
      setInterval(@resizeModal, 1000)

  appendModal: ->
    $('.modal').appendTo('body').modal
      fadeDuration: 300
      fadeDelay: 1.75


  resizeModal: ->
    $.modal.resize()
