exports = this
exports.YJ = Em.Application.create()

YJ.Term = Em.Object.extend(
  term: null
  description: null

  firstLetter: (->
    return @get('term').charAt(0).toUpperCase()
  ).property('term')

  sortValue: (->
    return @get("term")
  ).property("term")
)

####
# CONTROLLERS
####

YJ.termsController = Em.ArrayProxy.create(
  content: []
  currentTerm: null
  searchLetter: null

  # Start insert of code from examples.  This does the sorting

  # content: []
  add: (term) ->
    length = @get("length")
    idx = undefined
    srtValue = term.get('sortValue')
    console.log("termsController#add: sortValue='#{srtValue}'")
    idx = @binarySearch(srtValue, 0, length)
    console.log("termsController#add: sortValue='#{srtValue}'; idx='#{idx}'; length='#{length}'")
    @insertAt idx, term
    term.addObserver "sortValue", this, "termSortValueDidChange"

  # todo: move this to a SortedArrayProxy class
  binarySearch: (value, low, high) ->
    mid = undefined
    midValue = undefined
    return low  if low is high
    mid = low + Math.floor((high - low) / 2)
    midValue = @objectAt(mid).get("sortValue")
    return @binarySearch(value, mid + 1, high) if value > midValue
    return @binarySearch(value, low, mid) if value < midValue
    mid

  remove: (term) ->
    @removeObject term
    term.removeObserver "sortValue", this, "termSortValueDidChange"

  termSortValueDidChange: (term) ->
    console.log("termSortValueDidChange: '#{term.term}'")
    @remove term
    @add term

  newTerm: ->
    @add YJ.Term.create(term: "A term", definition: "A description")

  # End insert of code from examples



  editTerm: (term) ->
    console.log("editTerm: '#{term.term}' => '#{term.description}'")
    $("#indexTermView").hide()
    @set('currentTerm', term)
    YJ.editTermView = YJ.EditTermView.create()
    YJ.editTermView.append()

  updateTerm: () ->
    console.log("termsController#updateTerm - term: '#{@currentTerm.get('term')}'; description: '#{@currentTerm.get('description')}'")
    YJ.termsController.add(@currentTerm)
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
    t = YJ.Term.create(term: "Newt")
    t.set('description', 'plays fast and loose in debates')
    YJ.termsController.add(t)
    t = YJ.Term.create(term: "Santorum")
    t.set('description', 'Dan Savage coined his last name')
    YJ.termsController.add(t)
    t = YJ.Term.create(term: "Mitt")
    t.set('description', 'has a lot of money')
    YJ.termsController.add(t)

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
