YJ.termsController = Em.ArrayProxy.create(
  content: []
  searchLetter: null

  add: (term) ->
    length = @get("length")
    #    idx = undefined
    srtValue = term.get('sortValue')
    idx = @binarySearch(srtValue, 0, length)
    @insertAt idx, term
    term.addObserver "sortValue", this, "termSortValueDidChange"

  purge: ->
    @set('content', [])


  # todo: move this to a SortArray class
  binarySearch: (value, low, high) ->
    mid = undefined
    midValue = undefined
    return low  if low is high
    mid = low + Math.floor((high - low) / 2)
    midValue = @objectAt(mid).get("sortValue")
    return @binarySearch(value, mid + 1, high) if value > midValue
    return @binarySearch(value, low, mid) if value < midValue
    mid

  remove: (term) ->
    @removeObject term
    term.removeObserver("sortValue", this, "termSortValueDidChange")

  termSortValueDidChange: (term) ->
    console.log("termSortValueDidChange: '#{term.term}'")
    @remove term
    @add term

  filtered: (->
    if @get("searchLetter") is null
      @get('content')
    else
      @get('content').filterProperty 'firstLetter', @get('searchLetter')
  ).property('searchLetter').cacheable()
)
