YJ.AlphabetView = Em.View.extend(
    templateName: 'templates/alphabet'

    # The user clicked the 'all' link in the alphabet list
    all: (event) ->
      event.preventDefault() # this keeps the browser from trying to refresh/reload the page
      YJ.termsController.set('searchLetter', null)

    # The user clicked one of the letters in the alphabet list:
    choose: (event) ->
      event.preventDefault() # this keeps the browser from trying to refresh/reload the page
      console.log(event)
      YJ.termsController.set('searchLetter', event.context)

)
