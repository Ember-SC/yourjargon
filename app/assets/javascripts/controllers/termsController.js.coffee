###
  The controller that manages the list of terms in sorted order.  It also
  provides the filtered output when the user clicks one of the alphabet
  letters on the right side of the screen.
###
YJ.termsController = Em.ArrayProxy.create(

  # The sorted array of terms
  content: []

  # The place to hold the letter used to filter by the first letter
  searchLetter: null

  # Add a term in sorted order.
  add: (term) ->
    length = @get('length')
    #    idx = undefined
    srtValue = term.get('sortValue')
    idx = @binarySearch(srtValue, 0, length)
    @insertAt idx, term
    term.addObserver "sortValue", this, "termSortValueDidChange"

  ###
    Purge all terms
  ###
  purge: ->
    @set('content', [])

  ###
    @private
  ###
  binarySearch: (value, low, high) ->
    mid = undefined
    midValue = undefined
    return low  if low is high
    mid = low + Math.floor((high - low) / 2)
    midValue = @objectAt(mid).get("sortValue")
    return @binarySearch(value, mid + 1, high) if value > midValue
    return @binarySearch(value, low, mid) if value < midValue
    mid

  ###
    Remove a term
    @param {Em.Object} term
  ###
  remove: (term) ->
    @removeObject term
    term.removeObserver("sortValue", this, "termSortValueDidChange")

  ###
    @private
  ###
  termSortValueDidChange: (term) ->
    console.log("termSortValueDidChange: '#{term.term}'")
    @remove term
    @add term

  ###
    Returns the contests filtered by the first letter
  ###
  filtered: (->
    if @get("searchLetter") is null
      @get('content')
    else
      @get('content').filterProperty 'firstLetter', @get('searchLetter')
  ).property('searchLetter').cacheable()
)
