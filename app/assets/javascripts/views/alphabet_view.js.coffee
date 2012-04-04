YJ.AlphabetView = Em.View.extend(
    templateName: 'templates/alphabet'

    # The user clicked the 'all' link in the alphabet list
    all: (event) ->
      event.preventDefault() # this keeps the browser from trying to refresh/reload the page
      YJ.termsController.set('searchLetter', null)

)
