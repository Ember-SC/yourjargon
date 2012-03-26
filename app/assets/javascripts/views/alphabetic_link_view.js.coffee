YJ.AlphabetLinkView = Em.View.extend(

    click: (event) ->
      event.preventDefault() # this keeps the browser from trying to refresh/reload the page
      YJ.termsController.set('searchLetter', @get('content').valueOf())
)
