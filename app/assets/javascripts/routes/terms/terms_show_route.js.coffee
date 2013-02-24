YJ.TermsShowRoute = Ember.Route.extend(
  events:
    back: ( ->
      @send('terms.index')
    )

)
