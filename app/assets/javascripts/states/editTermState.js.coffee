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
      YJ.store.commit()
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
      term = YJ.currentTerm.termToDelete()
      console.log("Term to be deleted - id: #{term.id}")
      YJ.termsController.remove(term)
      term.deleteRecord()
      term = YJ.currentTerm.get('newTerm')
      term.deleteRecord()
      YJ.store.commit()
      manager.goToState('listTermsState')
  )
)
