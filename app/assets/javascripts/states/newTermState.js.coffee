YJ.StateManager.reopen(
  newTermState: Ember.ViewState.create(
    view: YJ.NewTermView

    addTerm: (manager) ->
      YJ.termsController.add(YJ.currentTerm.get('newTerm'))
      manager.goToState('mainState')

    cancelAddTerm: (manager) ->
      manager.goToState('mainState')
  )
)
