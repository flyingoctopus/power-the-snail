window.ReadyAppsRouter = new (Backbone.Router.extend(
  routes:
    "": "index"

  initialize: ->

  index: ->
    homeView = new HomeView()
    $("#app").hide()
    $("#app").html(homeView.render().el).fadeIn()

  start: ->
    Backbone.history.start()
))
