
YJ.stateManager = Em.StateManager.create(

  rootElement: '#content'

  mainState: Ember.ViewState.create(
    view: YJ.MainView
    isStart: true

    newTerm: (manager) ->
      YJ.termsController.set("currentTerm", YJ.Term.create())
      manager.goToState('newTermState')

    editTerm: (manager, term) ->
      YJ.termsController.set('currentTerm', Ember.copy(term, false))
      manager.goToState('editTermState')
  )

  newTermState: Ember.ViewState.create(
    view: YJ.NewTermView

    addCurrent: (manager) ->
      YJ.termsController.addCurrent()
      manager.goToState('mainState')

  )

  editTermState: Ember.ViewState.create(
    view: YJ.EditTermView

    updateTerm: (manager) ->
      manager.goToState('mainState')

    cancelEditCurrentTerm: (manager) ->
      YJ.termsController.set('currentTerm', null)
      manager.goToState('mainState')

    deleteCurrentTerm: (manager) ->
      YJ.termsController.deleteCurrentTerm()
      manager.goToState('mainState')
  )

  start: @.mainState

)
