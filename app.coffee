App = {
  init: ->
    # events
    Controller.events()

  timers: [
    blue: 300
    red: 300
    dragon: 360
    baron: 420
  ]
}

Controller = {

  events: ->
    $('button').on "click", Controller.startTimer

  startTimer: (ev) =>
    bttn = ev.target.className
    milsecs = App.timers.map((x) ->
        if x[0] = bttn
          return x[bttn]
      )
    # window.setTimeout resetTimer, secs
    ev.target.addClass 'disable'
    window.setTimeout
}


View = {

  timer: (secs)->
    window.setInterval secs

    if secs = 0
      console.log 'END TIMER'

}