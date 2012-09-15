YJ.EditTermController = Ember.ObjectController.extend(
  content: null

  term: ->
    @get('content')

  save: ->
#    @term().get('transaction').commit()

  cancel: ->
#    @term().get('transaction').rollback()

  delete: ->
#    @term().destroy()


)