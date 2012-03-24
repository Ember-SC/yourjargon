YJ.NewTermView = Em.View.extend(
    termBinding: 'YJ.termsController.currentTerm'
    templateName: 'templates/terms/new'
    add: ->
      YJ.stateManager.send('addCurrent')
)
