###
  The controller that manages the list of terms in sorted order.  It also
  provides the filtered output when the user clicks one of the alphabet
  letters on the right side of the screen.
###
YJ.reopen(
  termsController: Em.SortedArrayProxy.create(

    # The place to hold the letter used to filter by the first letter
    searchLetter: null

    initialLoad: ->
      console.log("inside initialLoad")
      @set('tempTerms', YJ.store.findQuery(YJ.Term, 'terms'))

    ###
      Returns the contents filtered by the first letter
    ###
    filtered: (->
      if @get("searchLetter") is null
        @get('content')
      else
        @get('content').filterProperty 'firstLetter', @get('searchLetter')
    ).property('searchLetter').cacheable()

    tempTerms: null

    # This is a callback that is invoked when YJ.tempTerms
    # has been completely filled by ember-data.
    # See http://stackoverflow.com/questions/10031283/ember-data-callback-when-findall-finished-loading-all-records
    # for further explanation.
    loadTerms: (->
      @get('tempTerms').forEach (term) ->
        console.log(term.get('term'))
        YJ.termsController.add(term)
    ).observes('tempTerms.isLoaded')
  )
)
