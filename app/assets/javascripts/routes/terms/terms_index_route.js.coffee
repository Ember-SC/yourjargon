YJ.TermsIndexRoute = Ember.Route.extend(

  events:

    allTerms: ( ->
      # The user clicked the 'all' link in the alphabet list
      @controllerFor('terms').set('searchLetter', null)
    )

    filterTerms: ((event) ->
      @controllerFor('terms').set('searchLetter', event.context)
    )

  connectOutlets: ((controller) ->
    controller.connectOutlet('termsIndex', controller.retrieveAllTerms())
  )
)
