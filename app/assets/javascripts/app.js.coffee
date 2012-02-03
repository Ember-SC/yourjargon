exports = this
exports.YJ = Em.Application.create()

YJ.submitTerm = (term) ->
  if term.get('definition') is undefined
    this.undefinedTermsController.pushObject(term)
  else
    this.definedTermsController.pushObject(term)

YJ.Term = Em.Object.extend(
  term: null
  description: null
)

YJ.definedTermsController = Em.ArrayProxy.create(content: [])
YJ.undefinedTermsController = Em.ArrayProxy.create(content: [])

