YJ.LoginView = Em.View.extend(
  templateName: 'templates/user/login'

  login: ""
  password: ""


  submit: ->
    console.log(this.login)
    YJ.userController.login(@login, @password)

  signup: ->
    YJ.stateManager.goToState('signupState')

  cancel: ->
    YJ.stateManager.goToState('listTermsState')
)