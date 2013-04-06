window.HomeView = Backbone.View.extend
  events: {}

  navCallback: (e) ->
    console.log e

  className: "home-view"

  initialize: ->

  render: ->
    compiledTemplate = JST["templates/home"]
    @$el.html compiledTemplate()
    @

  getData: ->

  setupTable: ->
    $("table#leaderboard").tablesorter({ sortList: [[1,0]] })

  setupGagues: ->
    g1 = new JustGage(
      id: "chartDiv1"
      value: 67
      min: 0
      max: 100
      title: "Stool 1"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    g2 = new JustGage(
      id: "chartDiv2"
      value: 67
      min: 0
      max: 100
      title: "Stool 2"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    g3 = new JustGage(
      id: "chartDiv3"
      value: 67
      min: 0
      max: 100
      title: "Stool 3"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )

    g4 = new JustGage(
      id: "chartDiv4"
      value: 67
      min: 0
      max: 100
      title: "Stool 4"
      titleFontColor: "#000"
      labelFontColor: "#000"
      showInnerShadow: true
    )
