App = {
  buffs:
    blue: 300,
    red: 300,
    dragon: 360,
    baron: 420

  init: ()->

    App.listeners()

  listeners: ()->

    $('button').on({
      "click": ()->
        sectionID = $(this).parent().parent().parent('.col-md-4').attr('id')
        buffName = $(this).text()

        $.each App.buffs, (i, v)->
          App.startTimer v, sectionID, buffName if buffName is i


      })

  startTimer: (int, i, buff)->
    countDown = int
    countDownName = buff

    App.renderBar i, buff
    countDownName = setInterval ()->

      if countDown <= 0
        clearInterval countDownName
        App.enableButton i, buff
        console.log "end of ", i + " " + buff

      else
        countDown = countDown - 1

    , 25


  renderBar: (i, buff)->
    $('#' + i + " ." + buff)
      .addClass 'disabled'

  enableButton: (i, buff)->
    $('#' + i + ' .' + buff)
      .removeClass 'disabled'
}

App.init()