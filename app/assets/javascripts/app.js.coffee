exports = this
exports.YJ = Em.Application.create()

YJ.Term = Em.Object.extend(
    term: null
    description: null
)

YJ.termController = Em.Object.create(
  currentTerm: null

  newTerm: ->
    $("#indexTermView").hide()
    @set('currentTerm', YJ.Term.create(term: "A term", definition: "A description"))
    YJ.editTermView = YJ.EditTermView.create()
    YJ.editTermView.append()

  updateTerm: ->
    console.log("update term controller")
    YJ.termsController.pushObject(@currentTerm)
    console.log(YJ.termsController.get('content').length)
    YJ.editTermView.remove()
    $("#indexTermView").show()

)

YJ.termsController = Em.ArrayProxy.create(
  content: []

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

####
# VIEWS
####


YJ.IndexTermView = Em.View.extend(
  templateName: 'templates/terms/index'
)

YJ.ListTermsView = Em.View.extend(
  templateName: 'templates/terms/list'
  termsBinding: 'YJ.termsController'
)

YJ.EditTermView = Em.View.extend(
  termBinding: 'YJ.termController.currentTerm'
  templateName: 'templates/terms/edit'

  update: ->
    YJ.termController.updateTerm()
)

YJ.NewButtonView = Em.View.extend(

  new: ->
    YJ.termController.newTerm()
)

# load test terms.

YJ.termsController.load()
