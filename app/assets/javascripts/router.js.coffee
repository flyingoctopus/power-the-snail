window.ReadyAppsRouter = new (Backbone.Router.extend(
  routes:
    "": "index"
    "login": "login"
    "users/edit": "editUser"

  initialize: ->

  index: ->
    homeView = new HomeView()
    $("#app").hide()
    $("#app").html(homeView.render().el).fadeIn()
    console.log 'this is being fired!'
    homeView.setupGagues()

  login: ->
    loginView = new LoginView()
    $("#app").hide()
    $("#app").html(loginView.render().el).fadeIn()

  start: ->
    Backbone.history.start()

  editUser: ->
    console.log 'edit!'
))

DataPoller =
  poll: ->
    setTimeout @request, 5000
  
  request: ->
    $.get($('#comments').data('url'), after: $('.comment').last().data('id'))
  
  addComments: (comments) ->
    if comments.length > 0
      $('#comments').append($(comments).hide())
      $('#show_comments').show()
    @poll()
  
  showComments: (e) ->
    e.preventDefault()
    $('.comment').show()
    $('#show_comments').hide()

#jQuery ->
  #if $('#comments').length > 0
    #CommentPoller.poll()
    #$('#show_comments a').click CommentPoller.showComments

