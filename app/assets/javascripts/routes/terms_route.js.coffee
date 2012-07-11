YJ.TermsRoute = Ember.Route.extend(
  route: '/terms'

  new: Ember.Route.extend(
    #EVENTS
    addTerm: ((router) ->
      router.get('newTermController').addTerm()
      router.send('goHome')
    )
    cancel: ((router) ->
      router.get('newTermController').cancel()
      router.send('goHome')
    )

    route: '/new'

    connectOutlets: (router) ->
      router.get('applicationController').connectOutlet('newTerm', YJ.Term.createRecord())
  )

  index: Ember.Route.extend(
    route: '/'
    #EVENTS
    allTerms: ((router, event) ->
      # The user clicked the 'all' link in the alphabet list
      YJ.router.get('termsController').set('searchLetter', null)
    )
    filterTerms: ((router, event) ->
      console.log(event.context)
      YJ.router.get('termsController').set('searchLetter', event.context)
    )

    connectOutlets: (router) ->
      router.get('applicationController').connectOutlet('terms', YJ.Term.find())
  )

  edit: Ember.Route.extend(
    route: ':term_id/edit'

    #EVENTS
    save: ((router) ->
      router.get('editTermController').save()
      router.transitionTo('home')
    )
    delete: ((router) ->
      router.get('editTermController').delete()
      router.transitionTo('home')
    )
    cancel: ((router) ->
      router.get('editTermController').cancel()
      router.transitionTo('home')
    )

    connectOutlets: (router, term) ->
      router.get('applicationController').connectOutlet('editTerm', term)
  )

  #      show: Ember.Route.extend(
  #        route: ':term_id'
  #
  #        connectOutlets: (router, term) ->
  #          router.get('applicationController').connectOutlet(YJ.Term)
  #      )
)