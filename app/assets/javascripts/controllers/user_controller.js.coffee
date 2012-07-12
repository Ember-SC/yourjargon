YJ.UserController = Em.ObjectController.extend(
  content: null

  logout: ->
    YJ.set('currentUser', YJ.User.create())

)