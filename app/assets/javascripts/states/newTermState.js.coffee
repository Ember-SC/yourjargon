YJ.StateManager.reopen(
  newTermState: Ember.ViewState.create(
    view: YJ.NewTermView

    addTerm: (manager) ->
      YJ.termsController.add(YJ.currentTerm.get('newTerm'))
      manager.goToState('listTermsState')

    cancelAddTerm: (manager) ->
      manager.goToState('listTermsState')
  )
)
