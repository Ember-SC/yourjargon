exports = this
exports.YJ = Em.Application.create()
YJ.Term = Em.Object.extend(
    term: null
    description: null
)
YJ.definedTermsController = Em.ArrayProxy.create(content: [])
