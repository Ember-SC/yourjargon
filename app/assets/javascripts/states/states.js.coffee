
YJ.stateManager = Em.StateManager.create(

  rootElement: '#content'

  mainState: Ember.ViewState.create(
    view: YJ.MainView
    isStart: true

    newTerm: (manager) ->
      YJ.currentTerm.createNewTerm()
      manager.goToState('newTermState')

    editTerm: (manager, term) ->
      YJ.currentTerm.editTerm(term)
      manager.goToState('editTermState')
  )

  newTermState: Ember.ViewState.create(
    view: YJ.NewTermView

    addTerm: (manager) ->
      YJ.termsController.add(YJ.currentTerm.get('newTerm'))
      manager.goToState('mainState')

  )

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

  start: @.mainState

)
