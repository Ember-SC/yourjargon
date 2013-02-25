YJ.TermShowRoute = Ember.Route.extend(
  events:
    back: ( ->
      @transitionTo('terms.index')
    )
    editTerm: ( ->
      @transitionTo('term.edit')
    )
)
