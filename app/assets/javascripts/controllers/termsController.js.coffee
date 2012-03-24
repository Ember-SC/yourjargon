YJ.termsController = Em.ArrayProxy.create(
    content: []
    currentTerm: null
    searchLetter: null

    add: (term) ->
      length = @get("length")
      #    idx = undefined
      srtValue = term.get('sortValue')
      console.log("termsController#add: sortValue='#{srtValue}'")
      idx = @binarySearch(srtValue, 0, length)
      console.log("termsController#add: sortValue='#{srtValue}'; idx='#{idx}'; length='#{@.get('content').length}'")
      @insertAt idx, term
      term.addObserver "sortValue", this, "termSortValueDidChange"

    addCurrent: ->
      @add(@currentTerm)

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

    newTerm: ->
      @set('currentTerm', YJ.Term.create())

    editTerm: (term) ->
      console.log("editTerm: '#{term.term}' => '#{term.description}'")
      @set('currentTerm', term)

    filtered: (->
      if @get("searchLetter") is null
        @get('content')
      else
        filteredList = @get('content').filterProperty 'firstLetter', @get('searchLetter')
    ).property('searchLetter').cacheable()


    # This is temporary so that we can see some generated data on the list page.  It will come out soon.
    loadTermsForTesting: ->
      t = YJ.Term.create(term: "Newt")
      t.set('description', 'plays fast and loose in debates')
      @add(t)
      t = YJ.Term.create(term: "Mitt")
      t.set('description', 'has a lot of money')
      @add(t)
      t = YJ.Term.create(term: "Santorum")
      t.set('description', 'Dan Savage coined his last name')
      @add(t)

    # Another debugger function. Will come out
    addTestTerm: ->
      t = YJ.Term.create(term: "Obama", description: "Good speaker")
      @pushObject(t)

)
