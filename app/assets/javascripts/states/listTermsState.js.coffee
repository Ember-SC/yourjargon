YJ.StateManager.reopen(
  listTermsState: Ember.ViewState.create(
    view: YJ.MainView
    isStart: true

    newTerm: (manager) ->
      YJ.currentTerm.createNewTerm()
      manager.goToState('newTermState')

    editTerm: (manager, term) ->
      YJ.currentTerm.editTerm(term)
      manager.goToState('editTermState')
  )
)
