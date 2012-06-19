###
  The controller that manages the list of terms in sorted order.  It also
  provides the filtered output when the user clicks one of the alphabet
  letters on the right side of the screen.
###
YJ.TermsController = Em.ArrayController.extend(
  # The place to hold the letter used to filter by the first letter
  searchLetter: null
  content: []

  ###
    Returns the contents filtered by the first letter
  ###
  filtered: (->
    if @get("searchLetter") is null
      @get('content')
    else
      @get('content').filterProperty 'firstLetter', @get('searchLetter')
  ).property('searchLetter').cacheable()

  initialLoad: ->
    @set('tempTerms', YJ.store.findQuery(YJ.Term, 'terms'))

  tempTerms: null

  # This is a callback that is invoked when YJ.tempTerms
  # has been completely filled by ember-data.
  # See http://stackoverflow.com/questions/10031283/ember-data-callback-when-findall-finished-loading-all-records
  # for further explanation.
  loadTerms: (->
    self = @
    @get('tempTerms').forEach (term) ->
      console.log(term.get('name'))
      self.pushObject(term)
  ).observes('tempTerms.isLoaded')


  add: (item) ->
    length = this.get('length')
    idx = this.binarySearch(item.get('orderBy'), 0, length)
    this.insertAt(idx, item)
    item.addObserver('orderBy', this, 'itemSortValueDidChange')

  remove: (item) ->
    this.removeObject(item)
    item.removeObserver('orderBy', this, 'itemSortValueDidChange')

  binarySearch: (value, low, high) ->
    if (low == high)
      return low

    mid = low + Math.floor((high - low) / 2)
    midValue = @objectAt(mid).get("orderBy")

    if value > midValue
      @binarySearch value, mid + 1, high
    else @binarySearch value, low, mid  if value < midValue

    return mid

  itemSortValueDidChange: (item) ->
    this.remove(item)
    this.add(item)

)
