window.LoginView = Backbone.View.extend
  events: {}

  navCallback: (e) ->
    console.log e

  className: "login-view"

  initialize: ->

  render: ->
    compiledTemplate = JST["templates/home"]
    @$el.html compiledTemplate()
    @
