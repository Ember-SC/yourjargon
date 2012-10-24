###
  The controller that manages the list of terms as follows:

  1. Sorted order by 'name'.
  2. If property 'searchLetter' is specified, then filters by the term's first letter.
  3. If property 'isDefined' is specified as true or false, then filters by whether a definition for the term exists or not.  true will return only defined terems; false will return only undefined terms.  null returns all terms, both defined and undefined.
  4. All conditions above are AND'd.  That is, if a search letter is specified AND the isDefined property is true, then only defined terms starting with the search letter are returned in sorted order.
###
YJ.TermsController = Em.ArrayController.extend(
  # The place to hold the letter used to filter by the first letter
  searchLetter: null
  content: []
  sortProperties: ['name']
  isDefined: null
  alphabet: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]


  allTerms: ((event) ->
      # The user clicked the 'all' link in the alphabet list
      @set('searchLetter', null)
  )
  
  filterTerms: ((event) ->
      @set('searchLetter', event.context)
  )

  filtered: (->
    noSearch = @get('searchLetter') is null
    noDefined = @get('isDefined') is null
    arranged = @get('arrangedContent')
    myself = @
    arranged.filter (item, index, arranged) ->
      if noSearch && noDefined
        true
      else if !noSearch && noDefined
        myself.filterSearchLetter(item)
      else if noSearch && !noDefined
        myself.filterIsDefined(item)
      else
        myself.filterIsDefined(item) && myself.filterSearchLetter(item)
  ).property('searchLetter','@each.isDefined')

  filterSearchLetter: (item) ->

    item.get('firstLetter') == @get('searchLetter')

  filterIsDefined: (item) ->
    item.get('isDefined') == @get('isDefined')

)
