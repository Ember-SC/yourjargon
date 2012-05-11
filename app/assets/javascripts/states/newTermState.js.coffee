YJ.StateManager.reopen(

  ###
    This state signifies that the user is in a view to edit
    the contents of a new term.
  ###
  newTermState: Ember.ViewState.create(
    view: YJ.NewTermView

    ###
      After filling in the term fields, this event signifies that the
      new term contents are to be added to the collection of terms
    ###
    addTerm: (manager) ->
      YJ.get('termsController').add(YJ.currentTerm.get('newTerm'))
      YJ.store.commit()
      manager.goToState('listTermsState')

    ###
      Event signifies that the new term and its contents are to be dropped
    ###
    cancelAddTerm: (manager) ->
      manager.goToState('listTermsState')
  )
)
