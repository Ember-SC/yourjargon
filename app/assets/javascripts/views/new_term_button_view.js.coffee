YJ.NewTermButtonView = Em.Button.extend(
    click: ->
      YJ.stateManager.send('newTerm')
)
