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

    App.renderBar i, buff, int
    countDownName = setInterval ()->

      if countDown <= 1
        clearInterval countDownName
        App.enableButton i, buff
        console.log "end of ", i + " " + buff

      else
        countDown = countDown - 1

    , 25


  renderBar: (i, buff, dur)->
    $buff = $('#' + i + " ." + buff)
    switch buff
      when "red" then buffColor = 'danger'
      when "blue" then buffColor = 'primary'
      when "dragon" then buffColor = 'warning'
      when "baron" then buffColor = 'success'

    $buff
      .addClass('hidden')
      .after('<div class="' + buff + ' progress"><div class="progress-bar progress-bar-lg progress-bar-' + buffColor + '" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"><span class="sr-only"></span></div></div>')

    duration = dur*0.025
    $('#' + i).find('.' + buff + '.progress .progress-bar')
      .css('animation', 'progBar ' + duration + 's linear 1')
      .css('-webkit-animation', 'progBar ' + duration + 's linear 1')


  enableButton: (i, buff)->
    $buff = $('#' + i + ' .' + buff)
    $progBar = $('#' + i).find('.' + buff + '.progress')
    $progBar
      .remove()
    $buff
      .removeClass 'hidden'

}

App.init()