YJ.HomeRoute = Ember.Route.extend(

  enter: (router) ->
    Ember.run.next ->
      router.send('checkUser')

)
