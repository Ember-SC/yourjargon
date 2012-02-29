exports = this
exports.YJ = Em.Application.create()

YJ.Term = Em.Object.extend(
    term: null
    description: null
)

YJ.termController = Em.Object.create(
  newTerm: ->
    YJ.editTermView.set('term', YJ.Term.create())
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

YJ.indexTermView = Em.View.extend(
  templateName: 'templates/terms/index'
)

YJ.editTermView = Em.View.create(
  tagName: 'form'
  templateName: 'templates/terms/edit'
  term: null
)

YJ.NewButtonView = Em.View.extend(

  new: ->
    YJ.termController.newTerm();
)
