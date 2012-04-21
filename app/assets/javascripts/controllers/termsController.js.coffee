###
  The controller that manages the list of terms in sorted order.  It also
  provides the filtered output when the user clicks one of the alphabet
  letters on the right side of the screen.
###
YJ.termsController = Em.SortedArrayProxy.create(

  # The place to hold the letter used to filter by the first letter
  searchLetter: null

  ###
    Returns the contents filtered by the first letter
  ###
  filtered: (->
    if @get("searchLetter") is null
      @get('content')
    else
      @get('content').filterProperty 'firstLetter', @get('searchLetter')
  ).property('searchLetter').cacheable()

  loadTerms: (->
    YJ.tempTerms.forEach (term) ->
      console.log(term.get('term'))
      YJ.termsController.add(term)
  ).observes('YJ.tempTerms.isLoaded')
)
