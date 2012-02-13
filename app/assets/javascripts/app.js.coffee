exports = this
exports.YJ = Em.Application.create()

YJ.Term = Em.Object.extend(
    term: null
    description: null
)

YJ.termsController = Em.ArrayProxy.create(content: [])

YJ.alphabetController = Em.ArrayProxy.create(
    content: []
    populate: ->
      codeA = 'A'.charCodeAt('A')
      codeZ = codeA + 26
      while codeA < codeZ
        this.pushObject(String.fromCharCode(codeA))
        codeA++
)

YJ.submitTerm = (term) ->
  this.termsController.pushObject(term)

