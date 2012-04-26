YJ.NavbarView = Em.View.extend(
  templateName: 'templates/navbar'
  login: ->
    console.log("clicked login")
    YJ.stateManager.goToState('loginState')

  logout: ->
    YJ.userController.logout()
)