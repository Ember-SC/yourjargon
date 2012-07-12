YJ.TermsRoute = Ember.Route.extend(
  route: '/terms'
  #EVENTS
  #defined at global level
  #newTerm: Ember.Route.transitionTo('terms.new')
  #viewTerms: Ember.Route.transitionTo('terms.index')
  editTerm: Ember.Route.transitionTo('edit')

  index: Ember.Route.extend(
    route: '/'
    #EVENTS
    allTerms: ((router, event) ->
      # The user clicked the 'all' link in the alphabet list
      YJ.router.get('termsController').set('searchLetter', null)
    )
    filterTerms: ((router, event) ->
      YJ.router.get('termsController').set('searchLetter', event.context)
    )

    connectOutlets: (router) ->
      router.get('applicationController').connectOutlet('terms', YJ.Term.find())
  )

  new: Ember.Route.extend(
    route: '/new'
    #EVENTS
    addTerm: ((router) ->
      router.get('newTermController').addTerm()
      router.send('viewTerms')
    )
    cancel: ((router) ->
      router.get('newTermController').cancel()
      router.send('viewTerms')
    )

    connectOutlets: (router) ->
      router.get('applicationController').connectOutlet('newTerm', YJ.Term.createRecord())
  )

  edit: Ember.Route.extend(
    route: ':term_id/edit'

    #EVENTS
    save: ((router) ->
      router.get('editTermController').save()
      router.transitionTo('index')
    )
    delete: ((router) ->
      router.get('editTermController').delete()
      router.transitionTo('index')
    )
    cancel: ((router) ->
      router.get('editTermController').cancel()
      router.transitionTo('index')
    )

    connectOutlets: (router, term) ->
      router.get('applicationController').connectOutlet('editTerm', term)
  )
)