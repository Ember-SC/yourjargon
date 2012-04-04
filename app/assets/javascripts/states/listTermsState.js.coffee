YJ.StateManager.reopen(

  ###
    This state indicates that the list of terms is being displayed
  ###
  listTermsState: Ember.ViewState.create(
    view: YJ.MainView

    ###
      The event signifies that a new term is to be created
    ###
    newTerm: (manager) ->
      YJ.currentTerm.createNewTerm()
      manager.goToState('newTermState')

    ###
      The event signifies that an existing term in the list is to be edited
    ###
    editTerm: (manager, term) ->
      YJ.currentTerm.editTerm(term)
      manager.goToState('editTermState')
  )
)
