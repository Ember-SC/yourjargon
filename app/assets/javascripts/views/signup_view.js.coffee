YJ.SignupView = Ember.View.extend(
  templateName: 'templates/user/signup'

  name: "",
  email: "",
  password: ""

  submit: ->
    YJ.userController.signup(@get(name), @get(email), @get(password))

  login: ->
    YJ.stateManager.goToState('loginState')

  cancel: ->
    YJ.stateManager.goToState('listTermsState')



)