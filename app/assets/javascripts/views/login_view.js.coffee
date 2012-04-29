YJ.LoginView = Em.View.extend(
  templateName: 'templates/user/login'

  submit: ->
    YJ.stateManager.send('authenticate')

  register: ->
    YJ.stateManager.send('register')

  cancel: ->
    YJ.stateManager.send('cancel')
)