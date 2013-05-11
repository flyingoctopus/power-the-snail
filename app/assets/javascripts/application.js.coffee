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
//= require jquery.fittext
//= require bootstrap
//= require bootstrapSwitch
//= require underscore
//= require backbone
//= require backbone.marionette
//= require_tree .

window.App =
  initialize: ->
    $("#app").hide()
    $("#app").fadeIn()

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
      max: 60
      title: "Stool 1"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    @g2 = new JustGage(
      id: "chartDiv2"
      value: 67
      min: 0
      max: 60
      title: "Stool 2"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    @g3 = new JustGage(
      id: "chartDiv3"
      value: 84
      min: 0
      max: 60
      title: "Stool 3"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    @g4 = new JustGage(
      id: "chartDiv4"
      value: 17
      min: 0
      max: 60
      title: "Stool 4"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    @g5 = new JustGage(
      id: "chartDivUser"
      value: 67
      min: 0
      max: 60
      title: "Stool 4"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

  updateGagues: (e) ->
    current = e.data.split(",")[4]
    $('.btn-group').children('button').each ->
      App.g5.refresh e.data.split(",")[$(@).val()] if $(@).hasClass("active")

    @g1.refresh Math.round e.data.split(",")[0] * current
    @g2.refresh Math.round e.data.split(",")[1] * current
    @g3.refresh Math.round e.data.split(",")[2] * current
    @g4.refresh Math.round e.data.split(",")[3] * current


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

$ ->
  if $('#chartDiv1').get(0)
    App.initialize()
    App.setupGagues()
    App.setupTable()
    App.poll()
