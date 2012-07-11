YJ.Router = Ember.Router.extend(
  enableLogging: true
  location: 'hash'

  root: Ember.Route.extend(
    # EVENTS
    newTerm: Ember.Route.transitionTo('terms.new')
    editTerm: Ember.Route.transitionTo('edit')
    viewTerms: Ember.Route.transitionTo('terms.index')
    cancel: Ember.Route.transitionTo('cancel')
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