YJ.UserSignupRoute = Ember.Route.extend(
 # route: '/register'
  events:
    createUser: (controller, event) ->
      if controller.get('registrationController').register()
        console.log('successfully created a user')
        controller.send('toDashboard')
      else
        console.log('failure to create user')
        controller.send('toRegister')

  renderTemplate: (controller) ->
    @render(controller: 'signup')

)