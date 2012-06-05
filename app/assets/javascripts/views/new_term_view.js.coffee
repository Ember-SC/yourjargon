###
  @class

  The view for the new term edit window
###
YJ.NewTermView = Em.View.extend(

  hasContentBinding: 'YJ.currentTerm.newTerm.hasContent'

  isDisabled: (->
    return !@get('hasContent') ? true : false
  ).property('hasContent')

  templateName: 'terms/new'

  # Event indicates user wants to keep the new term and add it
  add: ->
    YJ.stateManager.send('addTerm')

  # Event indicates user doesn't want to keep the new term, so it
  # will be discarded.
  cancel: ->
    YJ.stateManager.send('cancelAddTerm')

  didInsertElement: ->
    console.log("didIntertElement")
    #    @focus()
    @_super()
    @$('input:first').focus()
)
