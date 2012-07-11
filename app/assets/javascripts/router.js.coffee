YJ.Router = Ember.Router.extend(
  enableLogging: true
  location: 'hash'

  root: Ember.Route.extend(
    # EVENTS
    newTerm: Ember.Route.transitionTo('terms.new')
    viewTerms: Ember.Route.transitionTo('terms.index')
    goHome: Ember.Route.transitionTo('home')

    home: Ember.Route.extend(
      route: '/'

      connectOutlets: (router) ->
        appController = router.get('applicationController')
        appController.connectOutlet('home')
    )

    terms: YJ.TermsRoute
  )
)