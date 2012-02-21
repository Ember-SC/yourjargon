exports = this
exports.YJ = Em.Application.create()

YJ.Term = Em.Object.extend(
    term: null
    description: null
)

YJ.termsController = Em.ArrayProxy.create(content: [])

YJ.submitTerm = (term) ->
  this.termsController.pushObject(term)

