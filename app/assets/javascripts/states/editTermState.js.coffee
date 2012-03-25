YJ.StateManager.reopen(
  editTermState: Ember.ViewState.create(
    view: YJ.EditTermView

    updateTerm: (manager) ->
      YJ.currentTerm.updateTerm()
      manager.goToState('mainState')

    cancelEditCurrentTerm: (manager) ->
      manager.goToState('mainState')

    deleteCurrentTerm: (manager) ->
      YJ.termsController.remove(YJ.currentTerm.termToDelete())
      manager.goToState('mainState')
  )
)
