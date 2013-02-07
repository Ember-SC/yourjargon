YJ.UserLogoutRoute = Ember.Route.extend(
  redirect: ->
    @controllerFor('user').logout()
    @transitionTo('home')
)