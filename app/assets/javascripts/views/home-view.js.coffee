window.HomeView = Backbone.View.extend
  events: {}
  navCallback: (e) ->
    console.log e

  className: "home-view"
  initialize: ->

  render: ->
    compiledTemplate = JST["templates/home"]
    @$el.html compiledTemplate()
    this
