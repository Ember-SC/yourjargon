###
  @class

  The view for the term that the user clicked in the list of terms
###
YJ.LinkView = Em.View.extend(
    term: null

    click: (event) ->
      event.preventDefault() # this keeps the browser from trying to refresh/reload the page
      YJ.stateManager.send('editTerm', @term)
)
