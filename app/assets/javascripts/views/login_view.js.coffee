YJ.LoginView = Em.View.extend(
  templateName: 'templates/user/login'

  email: ""
  password: ""


  submit: ->
    console.log(this.email)
    YJ.userController.login(@email, @password)
)