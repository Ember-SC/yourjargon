YJ.AlphabetView = Em.View.extend(
    templateName: 'templates/alphabet'

    all: (event) ->
      event.preventDefault()
      YJ.termsController.set('searchLetter', null)

)
