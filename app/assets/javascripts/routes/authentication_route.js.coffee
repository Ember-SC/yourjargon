
YJ.AuthenticationRoute = Ember.Route.extend(
  events:
    authenticate: ((event) ->
      controller = @controllerFor('login')
      controller.authenticate((result) ->
        if result
          console.log('successfully logged in')
          controller.send('toDashboard')
        else
          console.log('failure to log in')
      )
    )

  setupControllers: ->
    @controllerFor('login')
)
