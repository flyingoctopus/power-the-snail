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
//= require jquery.bxslider
//= require jquery.fittext
//= require bootstrap
//= require bootstrapSwitch
//= require underscore
//= require backbone
//= require backbone.marionette
//= require_tree .

window.App =


  initialize: =>
    $("#app").hide()
    $("#app").fadeIn()
    App.chair = 1
    @gagueMin = 0
    @gagueMax = 80

  poll: ->
    ws = new WebSocket("ws://snailnet:8784")
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
    $('.checkbox').trigger('click')
    if $('.checkbox').prop('checked', true) then App.showUserGague() else App.showLeaderboard()
    #$("table#leaderboard").tablesorter({ sortList: [[1,0]] })
    $(".allGagues").hide()
    #$("#chartDivUser").hide()
    $("#chair1_select").click ->
      App.chair = 0
      $("#userChairLabel").html "Chair 1"
    $("#chair2_select").click ->
      App.chair = 1
      $("#userChairLabel").html "Chair 2"
    $("#chair3_select").click ->
      App.chair = 2
      $("#userChairLabel").html "Chair 3"
    $("#chair4_select").click ->
      App.chair = 3
      $("#userChairLabel").html "Chair 4"
    

  setupGagues: ->
    console.log 'setup gagues'
    @g1 = new JustGage(
      id: "chartDiv1"
      value: 35
      min: @gagueMin
      max: @gagueMax
      title: "Stool 1"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
      label: "Watts"
      showMinMax: false
    )

    @g2 = new JustGage(
      id: "chartDiv2"
      value: 67
      min: @gagueMin
      max: @gagueMax
      title: "Stool 2"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
      label: "Watts"
      showMinMax: false
    )

    @g3 = new JustGage(
      id: "chartDiv3"
      value: 84
      min: @gagueMin
      max: @gagueMax
      title: "Stool 3"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
      label: "Watts"
      showMinMax: false
    )

    @g4 = new JustGage(
      id: "chartDiv4"
      value: 17
      min: @gagueMin
      max: @gagueMax
      title: "Stool 4"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
      label: "Watts"
      showMinMax: false
    )

    @g5 = new JustGage(
      id: "chartDivUser"
      value: 67
      min: gagueMin
      max: 60
      title: " "
      titleFontColor: "#000"
      labelFontColor: "#000"
      label: "Watts"
      showMinMax: false
      #showInnerShadow: true
      #relativeGaugeSize: true
    )

    #@g1mobile = new JustGage(
      #id: "chartDiv1mobile"
      #value: 35
      #min: @gagueMin
      #max: @gagueMax
      #title: "Stool 1"
      #titleFontColor: "#000"
      #labelFontColor: "#000"
      #showInnerShadow: true
      #relativeGaugeSize: true
      #label: "Watts"
      #showMinMax: false
    #)

    #@g2mobile = new JustGage(
      #id: "chartDiv2mobile"
      #value: 67
      #min: @gagueMin
      #max: @gagueMax
      #title: "Stool 2"
      #titleFontColor: "#000"
      #labelFontColor: "#000"
      #showInnerShadow: true
      #relativeGaugeSize: true
      #label: "Watts"
      #showMinMax: false
    #)

    #@g3mobile = new JustGage(
      #id: "chartDiv3mobile"
      #value: 84
      #min: @gagueMin
      #max: @gagueMax
      #title: "Stool 3"
      #titleFontColor: "#000"
      #labelFontColor: "#000"
      #showInnerShadow: true
      #relativeGaugeSize: true
      #label: "Watts"
      #showMinMax: false
    #)

    #@g4mobile = new JustGage(
      #id: "chartDiv4mobile"
      #value: 17
      #min: @gagueMin
      #max: @gagueMax
      #title: "Stool 4"
      #titleFontColor: "#000"
      #labelFontColor: "#000"
      #showInnerShadow: true
      #relativeGaugeSize: true
      #label: "Watts"
      #showMinMax: false
    #)

    # Temp
    @g1Leaderboard = new JustGage(
      id: "chartDiv1Leaderboard"
      value: 35
      min: @gagueMin
      max: @gagueMax
      title: "Stool 1"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
      label: "Watts"
      showMinMax: false
    )

    @g2Leaderboard = new JustGage(
      id: "chartDiv2Leaderboard"
      value: 67
      min: @gagueMin
      max: @gagueMax
      title: "Stool 2"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
      label: "Watts"
      showMinMax: false
    )

    @g3Leaderboard = new JustGage(
      id: "chartDiv3Leaderboard"
      value: 84
      min: @gagueMin
      max: @gagueMax
      title: "Stool 3"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
      label: "Watts"
      showMinMax: false
    )

    @g4Leaderboard = new JustGage(
      id: "chartDiv4Leaderboard"
      value: 17
      min: @gagueMin
      max: @gagueMax
      title: "Stool 4"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
      label: "Watts"
      showMinMax: false
    )

  updateGagues: (e) ->
    current = e.data.split(",")[4]
    $('.btn-group').children('button').each ->
      App.g5.refresh e.data.split(",")[$(@).val()] if $(@).hasClass("active")

    @g1.refresh Math.round e.data.split(",")[0] * current
    @g2.refresh Math.round e.data.split(",")[1] * current
    @g3.refresh Math.round e.data.split(",")[2] * current
    @g4.refresh Math.round e.data.split(",")[3] * current
    #@g1mobile.refresh Math.round e.data.split(",")[0] * current
    #@g2mobile.refresh Math.round e.data.split(",")[1] * current
    #@g3mobile.refresh Math.round e.data.split(",")[2] * current
    #@g4mobile.refresh Math.round e.data.split(",")[3] * current
    @g1Leaderboard.refresh Math.round e.data.split(",")[0] * current
    @g2Leaderboard.refresh Math.round e.data.split(",")[1] * current
    @g3Leaderboard.refresh Math.round e.data.split(",")[2] * current
    @g4Leaderboard.refresh Math.round e.data.split(",")[3] * current

    @g5.refresh Math.round e.data.split(",")[App.chair] * current



  toggleTable: (e) ->
    switch e
      when false then App.showUserGague()
      when true then App.showLeaderboard()

  showUserGague: ->
    $('.allGagues').fadeOut()
    $('#chartDivUser').fadeIn()
    $('.chairSelect').fadeIn()

  showLeaderboard: ->
    $('#chartDivUser').fadeOut()
    $('.allGagues').fadeIn()
    $('.chairSelect').fadeOut()

  checkUser: (callback) ->
    that = this
    $.ajax "api/auth/logged_in",
      type: "GET"
      dataType: "json"
      success: ->
        callback true
      error: ->
      callback false

$ ->
  if $('#chartDiv1').get(0)
    App.initialize()
    App.setupGagues()
    App.setupTable()
    App.poll()
