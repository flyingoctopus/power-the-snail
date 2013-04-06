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

  setupGagues: ->
    g1 = new JustGage(
      id: "chartDiv1"
      value: 67
      min: 0
      max: 100
      title: "Stool #1"
    )

    g2 = new JustGage(
      id: "chartDiv2"
      value: 67
      min: 0
      max: 100
      title: "Stool #1"
    )

    g3 = new JustGage(
      id: "chartDiv3"
      value: 67
      min: 0
      max: 100
      title: "Stool #1"
    )

    g4 = new JustGage(
      id: "chartDiv4"
      value: 67
      min: 0
      max: 100
      title: "Stool #1"
    )
