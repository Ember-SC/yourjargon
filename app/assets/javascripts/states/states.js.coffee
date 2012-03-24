
YJ.stateManager = Em.StateManager.create(

    rootElement: '#content'

    mainState: Ember.ViewState.create(
        view: YJ.MainView
        isStart: true

        newTerm: ->
          YJ.termsController.set("currentTerm", YJ.Term.create())
          YJ.stateManager.goToState('newTermState')

        editTerm: (term) ->
          YJ.termsController.set('currentTerm', Ember.copy(term))
          YJ.stateManager.goToState('editTermState')
    )

    newTermState: Ember.ViewState.create(
        view: YJ.NewTermView

        addCurrent: ->
          YJ.termsController.addCurrent()
          YJ.stateManager.goToState('mainState')

    )

    editTermState: Ember.ViewState.create(
        view: YJ.EditTermView

        updateTerm: ->

          YJ.stateManager.goToState('mainState')

        cancelEditCurrentTerm: ->
          YJ.termsController.set('currentTerm', null)
          YJ.stateManager.goToState('mainState')

        deleteCurrentTerm: ->
          YJ.termsController.deleteCurrentTerm()
          YJ.stateManager.goToState('mainState')
    )

    start: @.mainState

)
