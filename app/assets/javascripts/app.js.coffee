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

YJ.termsController = Em.ArrayProxy.create(content: [])

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

YJ.newButtonView = Em.View.create(
  click: ->
    YJ.termController.newTerm()

)
