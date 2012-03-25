YJ.currentTerm = Em.Object.create(
  oldTerm: null
  newTerm: null

  createNewTerm: ->
    @set('newTerm', YJ.Term.create())

  editTerm: (term) ->
    @set('oldTerm', term)
    @set('newTerm', Ember.copy(term, false))

  updateTerm: ->
    @get('oldTerm').set('description', @get('newTerm').get('description'))

)
