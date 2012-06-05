###
  @class

  The view for the edit term page
###
YJ.EditTermView = Em.View.extend(

    templateName: 'terms/edit'

    update: ->
      YJ.stateManager.send('updateTerm')

    cancel: ->
      YJ.stateManager.send('cancelEditCurrentTerm')

    delete: ->
      YJ.stateManager.send('deleteCurrentTerm')
)
