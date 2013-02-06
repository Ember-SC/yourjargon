YJ.UserRoute = Ember.Route.extend(
  event:
    logout: ( (event) ->
      console.log("Logging out")
      @controllerFor('user').logout()
      $.removeCookie('account')
      @transitionTo('home')
    )
)
