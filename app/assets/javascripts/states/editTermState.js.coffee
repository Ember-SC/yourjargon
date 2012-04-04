YJ.StateManager.reopen(

  ###
    In this state, the user sees an edit view of the description.
  ###
  editTermState: Ember.ViewState.create(
    view: YJ.EditTermView

    ###
      The event signifies that changes to the term being edited are to be kept
    ###
    updateTerm: (manager) ->
      YJ.currentTerm.updateTerm()
      manager.goToState('listTermsState')

    ###
      The event signifies that changes to the term being edited were cancelled
    ###
    cancelEditCurrentTerm: (manager) ->
      manager.goToState('listTermsState')

    ###
      The event is to delete the term
    ###
    deleteCurrentTerm: (manager) ->
      YJ.termsController.remove(YJ.currentTerm.termToDelete())
      manager.goToState('listTermsState')
  )
)
