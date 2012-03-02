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
    @currentTerm = YJ.Term.create(term: "A term", definition: "A description")
    YJ.editTermView = YJ.EditTermView.create()
    YJ.editTermView.append()

  updateTerm: ->
    console.log("update term controller")
    YJ.termsController.pushObject(@currentTerm)
    YJ.editTermView.remove()
    $("#indexTermView").show()

)

YJ.termsController = Em.ArrayProxy.create(
  content: [],
  init: ->
    @load()

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
)

YJ.submitTerm = (term) ->
  this.termsController.pushObject(term)

YJ.IndexTermView = Em.View.extend(
  templateName: 'templates/terms/index'
)

YJ.EditTermView = Em.View.extend(
  termBinding: 'YJ.termController.currentTerm'
  templateName: 'templates/terms/edit'

  update: ->
    alert('Yeee')
    YJ.termController.updateTerm()
)

YJ.NewButtonView = Em.View.extend(

  new: ->
    YJ.termController.newTerm()
)
