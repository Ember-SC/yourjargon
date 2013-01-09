YJ.UsersRoute = Ember.Route.extend(

  events:
    toDashboard: ((router, event) ->
      router.transitionTo('dashboard')
    )

    newTerm: ((controller) ->
      controller.transitionTo('terms.new')
    )

    viewTerms: ((controller) ->
      controller.transitionTo('terms.index')
    )

  dashboard: Ember.Route.extend(
    events:
      createOrg: ((router, event) ->
        router.transitionTo('organizations.new')
        ;
      )

      joinOrg: ((router, event) ->
        # should join the organization that is passed in the context
        # org = event.context
        # router.transitionTo('organizations.index')
      )

      toOrg: ((router, event) ->
        router.transitionTo('organizations.organization.show', event.context)
      )

    enter: ->
      if YJ.get('currentUser')
        console.log("i'm in your dashboard outlets " + YJ.get('currentUser'))
      else
        @send('checkUser')


    setupControllers: ->
      @set('controller.content', YJ.get('currentUser'))
  )

#  registration: Ember.Route.extend(
#    route: '/register'
#    #EVENTS
#
#    createUser: ((router, event) ->
#      if router.get('registrationController').register()
#        console.log('successfully created a user')
#        router.send('toDashboard')
#      else
#        console.log('failure to create user')
#        router.send('toRegister')
#    )
#
#    connectOutlets: (router) ->
#      appController = router.get('applicationController')
#      appController.connectOutlet('registration')
#  )
#
#
#  edit: Ember.Route.extend(
#    route: '/edit'
#    #EVENTS
#    update: ((router, event) ->
#      router.get('userController').get('transaction').commit()
#      router.send('goHome')
#    )
#
#    connectOutlets: (router, context) ->
#      appController = router.get('applicationController')
#      userController = router.get('userController')
#      appController.connectOutlet(
#        viewClass: YJ.EditUserView,
#        controller: userController,
#        context: YJ.currentUser
#      )
#  )
)
