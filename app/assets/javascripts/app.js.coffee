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
      codeA = 'A'.charCodeAt()
      codeZ = codeA + 26
      while codeA < codeZ
        this.pushObject(String.fromCharCode(codeA))
        codeA++
      code0 = '0'.charCodeAt()
      code9 = code0 + 10
      while code0 < code9
        this.pushObject(String.fromCharCode(code0))
        code0++
)

YJ.submitTerm = (term) ->
  this.termsController.pushObject(term)

