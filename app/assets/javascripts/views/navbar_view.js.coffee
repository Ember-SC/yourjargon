YJ.NavbarView = Em.View.extend(
  templateName: 'templates/navbar'
  login: ->
    console.log("clicked login")
    YJ.stateManager.send('login')

  logout: ->
    YJ.userController.logout()
)
