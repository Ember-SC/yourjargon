###
  A manager object to hold the old value and the new modified value
  side-by-side until the user decides to keep the changed or
  cancel to keep the old.
###
YJ.currentTerm = Em.Object.create(
  oldTerm: null
  newTerm: null

  ###
    Initially create a new term for editing
  ###
  createNewTerm: ->
    @set('newTerm', YJ.Term.create())

  ###
    Hold a term for editing.

    This method copies it so that both the old term and new
    term can be kept.

    @param {YJ.Term} term
  ###
  editTerm: (term) ->
    @set('oldTerm', term)
    @set('newTerm', Ember.copy(term, false))

  ###
    Keep the modified term by setting the description
    of the new term into the old term.  The old term
    is the term that's ultimately kept.
  ###
  updateTerm: ->
    @get('oldTerm').set('description', @get('newTerm').get('description'))

  ###
    When a term is deleted from the edit, it needs to retrieve the term to delete.
  ###
  termToDelete: ->
    @get('oldTerm')

)
