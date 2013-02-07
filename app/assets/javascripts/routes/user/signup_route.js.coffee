YJ.UserSignupRoute = Ember.Route.extend(
 # route: '/register'
  events:
    createUser: (controller, event) ->
      if @controllerFor('signup').signup()
        console.log('successfully created a user')
        controller.transitionTo('user.dashboard')
      else
        console.log('failure to create user')

)