YJ.EditTermView = Em.View.extend(
    termBinding: 'YJ.termsController.currentTerm'
    templateName: 'templates/terms/edit'

    update: ->
      YJ.stateManager.send('updateTerm', @term)

    cancel: ->
      YJ.stateManager.send('cancelEditCurrentTerm')

    delete: ->
      YJ.stateManager.send('deleteCurrentTerm')
)
