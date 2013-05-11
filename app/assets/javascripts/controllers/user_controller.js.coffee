YJ.UserController = Em.ObjectController.extend(
  content: null

  logout: ->
    YJ.set('currentUser', null)
    $.removeCookie('account')

)
