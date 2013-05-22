###
  The controller that manages the list of terms as follows:

  1. Sorted order by 'name'.
  2. If property 'searchLetter' is specified, then filters by the term's first letter.
  3. If property 'isDefined' is specified as true or false, then filters by whether a definition for the term exists or not.  true will return only defined terems; false will return only undefined terms.  null returns all terms, both defined and undefined.
  4. All conditions above are AND'd.  That is, if a search letter is specified AND the isDefined property is true, then only defined terms starting with the search letter are returned in sorted order.
###
YJ.TermsIndexController = Ember.ArrayController.extend(
  # The place to hold the letter used to filter by the first letter
  searchLetter: null
  searchPhrase: null
  content: []
  sortProperties: ['name']
  alphabet: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

  retrieveAllTerms: ->
    @set('content', YJ.Term.find())

  allTerms: ( ->
    # The user clicked the 'all' link in the alphabet list
    @set('searchLetter', null)
  )
  
  filterTerms: ((letter) ->
    @set('searchLetter', letter)
  )

  toTerm: (term) ->
    @transitionToRoute('term', term)


  filtered: Ember.computed ->
    noSearchLetter = @get('searchLetter') is null
    arranged = @get('arrangedContent')
    controller = @
    if noSearchLetter
      arranged
    else
      arranged.filter (item) ->
        controller.filterSearchLetter(item)
  .property('searchLetter', 'arrangedContent')

  filterSearchLetter: (item) ->
     item.get('firstLetter') == @get('searchLetter')

  computeSearchResults: ->
    @set('content', YJ.Term.find({search: @get('searchPhrase')}))
)
