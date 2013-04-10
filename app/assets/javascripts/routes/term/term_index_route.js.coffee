YJ.TermIndexRoute = Ember.Route.extend(

  events:
    back: ( ->
      @transitionTo('terms.index')
    )
    editTerm: ((term) ->
      @transitionTo('term.edit', term)
    )

  renderTemplate: ->
    @render(controller: 'term')
)
