###
  The controller that manages the list of terms as follows:

  1. Sorted order by 'name'.
  2. If property 'searchLetter' is specified, then filters by the term's first letter.
  3. If property 'isDefined' is specified as true or false, then filters by whether a definition for the term exists or not.  true will return only defined terems; false will return only undefined terms.  nil returns all terms, both defined and undefined.
  4. All conditions above are AND'd.  That is, if a search letter is specified AND the isDefined property is true, then only defined terms starting with the search letter are returned in sorted order.
###
YJ.TermsController = Em.ArrayController.extend(
  # The place to hold the letter used to filter by the first letter
  searchLetter: null
  searchTerm: null
  content: []
  sortProperties: ['name']
  isDefined: null

  ###
    Returns the contents filtered by the first letter
  ###
  filtered: (->
    noSearch = @get('searchLetter') is null
    noDefined = @get('isDefined') is null
    sorted = @get('arrangedContent')
    if noSearch && noDefined
      sorted
    else if !noSearch && noDefined
      sorted.filterProperty 'firstLetter', @get('searchLetter')
    else if noSearch && !noDefined
      sorted.filterProperty ''
  ).property('searchLetter').cacheable()

)
