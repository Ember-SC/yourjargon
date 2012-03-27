YJ.StateManager.reopen(
  editTermState: Ember.ViewState.create(
    view: YJ.EditTermView

    updateTerm: (manager) ->
      YJ.currentTerm.updateTerm()
      manager.goToState('listTermsState')

    cancelEditCurrentTerm: (manager) ->
      manager.goToState('listTermsState')

    deleteCurrentTerm: (manager) ->
      YJ.termsController.remove(YJ.currentTerm.termToDelete())
      manager.goToState('listTermsState')
  )
)
