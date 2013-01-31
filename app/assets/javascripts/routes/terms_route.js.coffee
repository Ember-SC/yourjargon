#YJ.TermsRoute = Ember.Route.extend(
#  route: '/terms'
#  #EVENTS
#  #defined at global level
#  #newTerm: Ember.Route.transitionTo('terms.new')
#  toShow: ((router, event) ->
#    router.transitionTo('terms.show', event.context)
#  )
#
#  editTerm: ((router, event) ->
#    router.transitionTo('terms.edit', event.context)
#  )
#
#
#  index: Ember.Route.extend(
#    route: '/'
#    #EVENTS
#    allTerms: ((router, event) ->
#      # The user clicked the 'all' link in the alphabet list
#      router.get('termsController').set('searchLetter', null)
#    )
#    filterTerms: ((router, event) ->
#      router.get('termsController').set('searchLetter', event.context)
#    )
#
#    connectOutlets: (router) ->
#      router.get('applicationController').connectOutlet('terms', YJ.Term.find())
#  )
#
#  show: Ember.Route.extend(
#    route: '/:term_id'
#    back: ((router) ->
#      router.send('termCreated')
#    )
#
#    connectOutlets: (router, term) ->
#       router.get('applicationController').connectOutlet('term', term)
#  )
#
#  search: Ember.Route.extend(
#    route: '/search'
#    #EVENTS
#    filterTerms: ((router, event) ->
#      router.get('searchController').set('searchLetter', event.context)
#    )
#    allTerms: ((router, event) ->
#        # The user clicked the 'all' link in the alphabet list
#      router.get('searchController').set('searchLetter', null)
#    )
#
#    connectOutlets: (router, context) ->
#      searchTerm = YJ.get('searchTerm').term
#      terms = YJ.Term.find(name: YJ.searchTerm.get('term'))
#      router.get('applicationController').connectOutlet(
#              viewClass: YJ.TermsView
#              controller: YJ.router.searchController
#              context: YJ.Term.find(search: searchTerm)
#      )
#  )
#
#  new: Ember.Route.extend(
#    route: '/new'
#    #EVENTS
#    addTerm: ((router) ->
#      router.get('newTermController').addTerm()
#      router.send('viewTerms')
#    )
#    cancel: ((router) ->
#      router.get('newTermController').cancel()
#      router.send('viewTerms')
#    )
#
#    connectOutlets: (router) ->
#      router.get('applicationController').connectOutlet('newTerm')
#  )
#
#  edit: Ember.Route.extend(
#    route: '/:term_id/edit'
#
#    #EVENTS
#    save: ((router) ->
#      router.get('editTermController').save()
#      router.transitionTo('index')
#    )
#    delete: ((router) ->
#      router.get('editTermController').delete()
#      router.transitionTo('index')
#    )
#    cancel: ((router) ->
#      router.get('editTermController').cancel()
#      router.transitionTo('index')
#    )
#
#    connectOutlets: (router, term) ->
#      router.get('applicationController').connectOutlet('editTerm', term)
#  )
#)
