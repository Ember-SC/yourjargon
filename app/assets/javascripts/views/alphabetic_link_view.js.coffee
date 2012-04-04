YJ.AlphabetLinkView = Em.View.extend(

    # The user clicked one of the letters in the alphabet list:
    click: (event) ->
      event.preventDefault() # this keeps the browser from trying to refresh/reload the page
      YJ.termsController.set('searchLetter', @get('content').valueOf())
)
