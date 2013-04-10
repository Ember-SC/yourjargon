YJ.TermsIndexRoute = Ember.Route.extend(

  events:

    toShow: ((term) ->
      @transitionTo('term', term)
    )

    allTerms: ( ->
      # The user clicked the 'all' link in the alphabet list
      @controllerFor('terms').set('searchLetter', null)
    )

    filterTerms: ((event) ->
      @controllerFor('terms').set('searchLetter', event.context)
    )

  setupController: ((controller) ->
    controller.retrieveAllTerms()
  )

  activate: ->
    @send('checkUser')

  # This method isn't necessary at all because it's covered by the naming convention,
  # but if you get it wrong, it's a 'pita' to figure out.
  renderTemplate: ->
    # This works.
#    @render(controller: 'terms.index')

    # This also works:
    @render('terms.index')

    # These invokations silently break bindings and its a 'pita' to track down:
#    @render(controller: 'terms')
#    @render('terms')
#    @render('termsIndex')
#    @render('termsIndexController')

)
