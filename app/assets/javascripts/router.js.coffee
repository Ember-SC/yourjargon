YJ.Router = Ember.Router.extend(
  enableLogging: true
  location: 'hash'

  root: Ember.Route.extend(
    # EVENTS
    newTerm: Ember.Route.transitionTo('terms.new')
    viewTerms: Ember.Route.transitionTo('terms.index')
    goHome: Ember.Route.transitionTo('home')
    toLogin: Ember.Route.transitionTo('users.authentication')
    toRegister: Ember.Route.transitionTo('users.registration')
    toEdit: Ember.Route.transitionTo('users.edit')
    cancel: Ember.Route.transitionTo('home')
    logout: ((router, event) ->
      router.get('userController').logout()
      router.send('goHome')
    )

    home: Ember.Route.extend(
      route: '/'

      connectOutlets: (router) ->
        appController = router.get('applicationController')
        appController.connectOutlet('home')
    )

    users: YJ.UsersRoute

    terms: YJ.TermsRoute
  )
)