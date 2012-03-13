exports = this
exports.YJ = Em.Application.create()

YJ.Term = Em.Object.extend(
    term: null
    description: null

    firstLetter: (->
      return @get('term').charAt(0).toUpperCase()
    ).property('term')

)

####
# CONTROLLERS
####

YJ.termsController = Em.ArrayProxy.create(
  content: []
  currentTerm: null
  searchLetter: null

  newTerm: ->
    @editTerm(YJ.Term.create(term: "A term", definition: "A description"))


  editTerm: (term) ->
    console.log("editTerm: '#{term.term}' => '#{term.description}'")
    $("#indexTermView").hide()
    @set('currentTerm', term)
    YJ.editTermView = YJ.EditTermView.create()
    YJ.editTermView.append()

  updateTerm: () ->
    console.log("termsController#updateTerm - term: '#{@currentTerm.get('term')}'; description: '#{@currentTerm.get('description')}'")
    YJ.termsController.pushObject(@currentTerm)
    console.log("update term controller - length: " + YJ.termsController.content.length)
    YJ.editTermView.remove()
    $("#indexTermView").show()

  filtered: (->
    if @get("searchLetter") is null
      @get('content')
    else
      filteredList = @get('content').filterProperty 'firstLetter', @get('searchLetter')
  ).property('searchLetter').cacheable()


  # This is temporary so that we can see some generated data on the list page.  It will come out soon.
  load: ->
    t1 = YJ.Term.create(term: "Mitt")
    t1.set('description', 'has a lot of money')
    t2 = YJ.Term.create(term: "Newt")
    t2.set('description', 'plays fast and loose in debates')
    t3 = YJ.Term.create(term: "Santorum")
    t3.set('description', 'Dan Savage coined his last name')
    @pushObject(t1)
    @pushObject(t2)
    @pushObject(t3)

  # Another debugger function. Will come out
  addTestTerm: ->
    t = YJ.Term.create(term: "Obama", description: "Good speaker")
    @pushObject(t)

)

YJ.alphabetController = Em.ArrayProxy.create(
  content: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
)

####
# VIEWS
####


YJ.IndexTermView = Em.View.extend(
  templateName: 'templates/terms/index'
)

YJ.ListTermsView = Em.View.extend(
  templateName: 'templates/terms/list'
  termsBinding: 'YJ.termsController.filtered'
)

YJ.LinkView = Em.View.extend(
  term: null

  edit: (event) ->
    event.preventDefault() # this keeps the browser from trying to refresh/reload the page
    term = this.get('term')
    console.log(this.get('term'))
    YJ.termsController.editTerm(term)
)

YJ.EditTermView = Em.View.extend(
  termBinding: 'YJ.termsController.currentTerm'
  templateName: 'templates/terms/edit'

  update: ->
    YJ.termsController.updateTerm()
)

YJ.NewButtonView = Em.View.extend(

  new: ->
    YJ.termsController.newTerm()
)

YJ.AlphabetView = Em.View.extend(
  templateName: 'templates/alphabet'

  all: (event) ->
    event.preventDefault()
    YJ.termsController.set('searchLetter', null)

)

YJ.AlphabetLinkView = Em.View.extend(


  click: (event) ->
    event.preventDefault() # this keeps the browser from trying to refresh/reload the page
    YJ.termsController.set('searchLetter', @get('content').valueOf())
)

# load test terms.

YJ.termsController.load()
