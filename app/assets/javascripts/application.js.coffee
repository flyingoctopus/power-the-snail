#// This is a manifest file that'll be compiled into application.js, which will include all the files
#// listed below.
#//
#// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
#// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#//
#// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
#// the compiled file.
#//
#// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
#// GO AFTER THE REQUIRES BELOW.
//= require jquery
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.fittext
//= require bootstrap
//= require bootstrapSwitch
//= require underscore
//= require backbone
//= require backbone.marionette
//= require_tree .

window.App = {}

window.App =
  initialize: ->
    $("#app").hide()
    $("#app").fadeIn()

  poll: ->
    ws = new WebSocket("ws://192.168.1.120:8784")
    ws.onmessage = (e) ->
      App.updateGagues(e)


  request: ->
    $.getJSON "data.json", (data) ->
      items = []
      $.each data, (key, val) ->
        console.log "key: " + key + " val: " + val
        console.log val

    #$.get('data.json', after: $('').last().data('id'))

  setupTable: ->
    $("table#leaderboard").tablesorter({ sortList: [[1,0]] })
    $("#chartDivUser").hide()
    $(".switch").on "switch-change", (e, data) ->
      value = data.value
      App.toggleTable(value)

  setupGagues: ->
    console.log 'setup gagues'
    @g1 = new JustGage(
      id: "chartDiv1"
      value: 35
      min: 0
      max: 100
      title: "Stool 1"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    @g2 = new JustGage(
      id: "chartDiv2"
      value: 67
      min: 0
      max: 100
      title: "Stool 2"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    @g3 = new JustGage(
      id: "chartDiv3"
      value: 84
      min: 0
      max: 100
      title: "Stool 3"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    @g4 = new JustGage(
      id: "chartDiv4"
      value: 17
      min: 0
      max: 100
      title: "Stool 4"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    #@g5 = new JustGage(
      #id: "chartDivUser"
      #value: 67
      #min: 0
      #max: 100
      #title: "Stool 4"
      #titleFontColor: "#000"
      #labelFontColor: "#000"
      #showInnerShadow: true
    #)

  updateGagues: (e) ->
    $('.btn-group').children('button').each ->
      App.g5.refresh e.data.split(",")[$(@).val()] if $(@).hasClass("active")

    @g1.refresh e.data.split(",")[0]
    @g2.refresh e.data.split(",")[1]
    @g3.refresh e.data.split(",")[2]
    @g4.refresh e.data.split(",")[3]


  toggleTable: (e) ->
    switch e
      when true then App.showUserGague()
      when false then App.showLeaderboard()

  showUserGague: ->
    $('.leaderboard').fadeOut()
    $('#chartDivUser').fadeIn()

  showLeaderboard: ->
    $('#chartDivUser').fadeOut()
    $('.leaderboard').fadeIn()

  checkUser: (callback) ->
    that = this
    $.ajax "api/auth/logged_in",
      type: "GET"
      dataType: "json"
      success: ->
        callback true
      error: ->
      callback false

  startSpeedometer: ->
    # min = 0;
    # max = 360;

    min = -90
    max = 90
    speed = .1
    current_amount = min
    isAccelerating = false
    oldMin = -90
    oldMax = 90
    oldRange = oldMax - oldMin
    newMin = 0
    newMax = 360
    newRange = newMax - newMin

    $("body").keydown (event) ->
      if event.which is 32 or event.which is 39
        isAccelerating = true
        setSpeedometer current_amount + speed

    $("body").keyup (event) ->
      if event.which is 32 or event.which is 39
        isAccelerating = false
        event.preventDefault()

    $("#slider").slider
      range: "max"
      min: min
      max: max
      value: min
      step: speed
      slide: (event, ui) ->
        setSpeedometer ui.value

      $(".ui-slider-handle").unbind "keydown"
      setInterval decelerate, 100

    # oldRange newRange oldMax oldMin newMax newMin oldValue newValue;
    # oldRange = (oldMax - oldMin);
    # newRange = (newMax - newMin);
    # newValue = (((oldValue - oldMin) * newRange) / oldRange) + newMin);
    setSpeedometer = (value) -> # oldValue
      # value = ((((oldValue - oldMin) * newRange) / oldRange) + newMin);
      console.log value
      if value <= max and value >= min
        current_amount = value
        console.log "Rotated " + value + " degrees!"
        $("#box").css
          WebkitTransform: "rotate(" + value + "deg)"
          MozTransform: "rotate(" + value + "deg)"

        $("#slider").slider value: current_amount

    decelerate = ->
      setSpeedometer current_amount - speed  unless isAccelerating



$ ->
  if $('#chartDiv1').get(0)
    App.initialize()
    App.setupGagues()
    App.startSpeedometer()
    App.setupTable()
    App.poll()
