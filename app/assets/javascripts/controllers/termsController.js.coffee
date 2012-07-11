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

)
