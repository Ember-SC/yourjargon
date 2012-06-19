YJ.Router = Ember.Router.extend(
  enableLogging: true
  location: 'hash'

  root: Ember.State.extend(
    # EVENTS
    newTerm: Ember.State.transitionTo('terms.new')
    editTerm: Ember.State.transitionTo('edit')
    viewTerms: Ember.State.transitionTo('terms.index')
    cancel: Ember.State.transitionTo('cancel')
    goHome: Ember.State.transitionTo('home')

    home: Ember.State.extend(
      route: '/'
      redirectsTo: 'terms.index'

      #      connectOutlets: (router) ->
      #        appController = router.get('applicationController')
      #        appController.connectOutlet(YJ.MainView)


    )

    terms: Ember.State.extend(
      route: '/terms'

      new: Ember.State.extend(
        #EVENTS

        route: '/new'

        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet(YJ.NewTermView, YJ.Term.createRecord())
      )

      index: Ember.State.extend(
        route: '/'

        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet(YJ.TermsView, YJ.Term.find())
      )

      edit: Ember.State.extend(
        route: ':term_id/edit'

        connectOutlets: (router, term) ->
          router.get('applicationController').connectOutlet(YJ.EditTermView, term)
      )

      #      show: Ember.State.extend(
      #        route: ':term_id'
      #
      #        connectOutlets: (router, term) ->
      #          router.get('applicationController').connectOutlet(YJ.Term)
      #      )
    )



    #    loggedIn: Ember.State.extend(
    #      #EVENTS
    #      logout: Ember.State.transitionTo('loggedOut')

    #      route: '/'
    #    )
    #
    #    loggedOut: Ember.State.extend(
    #      #EVENTS
    #      login: Ember.State.transitionTo('loggedIn')
    #
    #      route: '/login'
    #    )

  )
)