###
  @class

  This view captures 'new term' events
###
YJ.NewTermButtonView = Em.Button.extend(

    # User clicked to create a new term
    click: ->
      YJ.stateManager.send('newTerm')
)
