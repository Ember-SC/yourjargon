YJ.EditTermController = Ember.Controller.extend(
  save: (event) ->
    console.log("saving")
    term = event.context.content
    term.get('transaction').commit()
    YJ.stateManager.send('viewTerms')

  cancel: (event) ->
    console.log('canceling change')
    term = event.context.content
    term.get('transaction').rollback()
    YJ.stateManager.send('viewTerms')

  delete: (event) ->
    term = event.context.content
    term.destroy()
    YJ.stateManager.send('viewTerms')


)