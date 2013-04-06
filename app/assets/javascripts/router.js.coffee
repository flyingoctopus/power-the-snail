window.ReadyAppsRouter = new (Backbone.Router.extend(
  routes:
    "": "index"
    "login": "login"

  initialize: ->

  index: ->
    homeView = new HomeView()
    $("#app").hide()
    $("#app").html(homeView.render().el).fadeIn()
    homeView.setupGagues()

  login: ->
    loginView = new LoginView()
    $("#app").hide()
    $("#app").html(loginView.render().el).fadeIn()

  start: ->
    Backbone.history.start()
))
