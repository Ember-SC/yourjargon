YJ.NewTermView = Em.View.extend(
    termBinding: 'YJ.currentTerm.newTerm'
    templateName: 'templates/terms/new'
    add: ->
      YJ.stateManager.send('addTerm')
)
