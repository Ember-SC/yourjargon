###
  @class

  The view for the new term edit window
###
YJ.NewTermView = Em.View.extend(

    # Changes in the new term edit window are instantly bound
    # to the 'newTerm' attribute in the currentTerm model.
    termBinding: 'YJ.currentTerm.newTerm'

    hasContentBinding: 'YJ.currentTerm.newTerm.hasContent'

    isDisabled: (->
      return !@get('hasContent') ? true : false
    ).property('hasContent')

    templateName: 'templates/terms/new'

    # Event indicates user wants to keep the new term and add it
    add: ->
      YJ.stateManager.send('addTerm')

    # Event indicates user doesn't want to keep the new term, so it
    # will be discarded.
    cancel: ->
      YJ.stateManager.send('cancelAddTerm')

    newTerm: Em.TextField.extend(
      didInsertElement: ->
        @focus()

      valueBinding: "YJ.currentTerm.newTerm.term"
    )
)
