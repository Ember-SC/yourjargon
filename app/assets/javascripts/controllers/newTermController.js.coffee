YJ.NewTermController = Ember.Controller.extend(
  content: null

  term: ->
    @get('content')

  addTerm: ->
    @term().get('transaction').commit()

  cancel: ->
    @term().destroy()
)