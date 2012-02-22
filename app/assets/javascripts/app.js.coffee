exports = this
exports.YJ = Em.Application.create()

YJ.Term = Em.Object.extend(
    term: null
    description: null
)

YJ.termController = Em.Object.create(
  newTerm: ->

)

YJ.termsController = Em.ArrayProxy.create(content: [])

YJ.submitTerm = (term) ->
  this.termsController.pushObject(term)

YJ.newButtonView = Em.View.create(
  click: ->
    alert("new Button called")
    YJ.termController.newTerm()

)