YJ.TermsShowRoute = Ember.Route.extend(
  events:
    back: ( ->
      @transitionTo('terms.index')
    )

)
