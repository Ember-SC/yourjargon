YJ.SearchController = Em.ArrayController.extend(
  searchLetter: null
  searchTerm: null
  content: []
  sortProperties: ['name']

  ###
    Returns the contents filtered by the first letter
  ###
  filtered: (->
    if @get("searchLetter") is null
      @get('arrangedContent')
    else
      @get('arrangedContent').filterProperty 'firstLetter', @get('searchLetter')
  ).property('searchLetter').cacheable()
)