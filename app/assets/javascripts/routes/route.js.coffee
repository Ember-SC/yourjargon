Ember.Route.reopen(
  events:
    toSearch: ( ->
      searchPhrase = YJ.get('searchPhrase')
      console.log("Search is " + searchPhrase)
      controller = @controllerFor('termsIndex')
      controller.set('searchPhrase', searchPhrase)
      controller.computeSearchResults()
    )

    alert: (alert) ->
      @controllerFor('application').set('alert', alert)
)
