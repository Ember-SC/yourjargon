YJ.RegisterView = Ember.View.extend(
  templateName: 'templates/user/register'

  submit: ->
    YJ.stateManager.send('doRegister')

  login: ->
    YJ.stateManager.send('login')

  cancel: ->
    YJ.stateManager.send('cancel')



)