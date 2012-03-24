YJ.NewTermButton = Em.Button.extend(
    click: ->
      YJ.stateManager.send('newTerm')
)
