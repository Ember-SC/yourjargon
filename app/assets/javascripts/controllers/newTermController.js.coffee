YJ.NewTermController = Ember.Controller.extend(
  addTerm: ->
    YJ.store.commit()
    YJ.stateManager.send('viewTerms')

  cancel: (event) ->
    term = event.context.content
    term.destroy()
    YJ.stateManager.send('viewTerms')
)