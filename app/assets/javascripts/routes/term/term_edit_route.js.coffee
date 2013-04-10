YJ.TermEditRoute = Ember.Route.extend(

  events:
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

  renderTemplate: ->
    @render(controller: 'term')
)
